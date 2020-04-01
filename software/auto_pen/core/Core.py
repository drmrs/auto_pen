# Auto Pen
# Copyright (C) 2020  Dr. Mrs. The Mistress
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from time import sleep
from random import randint, choice
import signal
import subprocess
import os
from RPi import GPIO


class StepperInterface:

    def __init__(self, profile: dict = None):
        """
        Our high level abstraction over stepper motor control.
        Args:
            profile: dict: configuration profile
        """

        # First thing we do is change to realtime mode
        try:
            self.__change_to_rt_mode()
        except Exception as e:
            print(f'In order to get to real time mode we need access to the `chrt` command. Run as root? {e}')
            exit()

        # We setup a signal handler
        signal.signal(signal.SIGINT, self.__signal_handler)
        self.interrupted = False

        if profile is None:
            raise Exception('The stepper interface requires a profile')

        # We make out profile available
        self.__profile = profile

        # We configure GPIO with our pins
        GPIO.setwarnings(False)
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.__profile['stepper']['step_pin'], GPIO.OUT)
        GPIO.setup(self.__profile['stepper']['direction_pin'], GPIO.OUT)
        GPIO.setup(self.__profile['stepper']['enable_pin'], GPIO.OUT)

    def __signal_handler(self, _1, _2):
        self.interrupted = True

    @staticmethod
    def __change_to_rt_mode():
        subprocess.Popen(['chrt', '-r', '-p', '99', f'{os.getpid()}']).wait()


    def random_stroke(self, thrust: int = None, total_stroke_goal: int = 16364, lock_after_done: bool = True):
        """
        Causes the stepper motor to randomly change speed and strokes per speed setting.
        Args:
            total_stroke_goal: int: How many strokes we want to do. Insertion and withdraw would be two strokes
            lock_after_done: bool: if we want to lock the arm in place when done (default False)

        Returns: None

        """

        # We turn on the stepper motor (enable held low turns it on)
        GPIO.output(self.__profile['stepper']['enable_pin'], False)

        # For safety reasons first stroke should always be a withdraw. We preset the stepper now
        turn_left = True
        GPIO.output(self.__profile['stepper']['direction_pin'], turn_left)

        # We keep track of steps and switches so we know when to change direction and when to stop and change speed.
        step_count = 0
        switch_count = 0

        speeds = self.__profile['speeds']

        # We start by selecting a random speed.
        initial_speed_key = choice(list(speeds.keys()))
        initial_speed = speeds[initial_speed_key]

        # This is how long to wait between steps (i.e. speed)
        # We store it twice to avoid the need to do decimal math.
        wait_time = initial_speed['step_sleep']
        working_wait_time = wait_time

        # We slow things down to start because the first time we loop we speed up at the beginning.
        # (We assume we are slower because after the first stroke we are always coming from a slowed down motion
        for i in range(initial_speed['speed_change_range_steps']):
            working_wait_time = working_wait_time * initial_speed['speed_change_factor']

        # Here we randomly select the stroke count for the starting speed
        current_stroke_goal = randint(initial_speed['min_random_stroke'], initial_speed['max_random_stroke'])
        current_stroke = 0

        # The main stroke loop.
        while switch_count < total_stroke_goal:

            # This block is the heart of the action one set pin to high
            # then low moves the stepper motor forward one step.
            # We increment the step count then sleep. The sleep time controls the speed of the motor
            GPIO.output(self.__profile['stepper']['step_pin'], True)
            GPIO.output(self.__profile['stepper']['step_pin'], False)
            step_count += 1
            sleep(working_wait_time)

            # Here is when the logic happens. We decide what to do based on what step we are on.
            if step_count <= initial_speed['speed_change_range_steps']:
                # If we are in the first n steps we speed up by decreasing the sleep time
                working_wait_time = working_wait_time / initial_speed['speed_change_factor']

                # Floating point math causes things to slowly slow down over time, but Decimal math is too slow to do
                # in this loop. A nice solution is to just reset things every stroke.
                if step_count == initial_speed['speed_change_range_steps']:
                    working_wait_time = wait_time
            # We slow down for the last n steps
            elif step_count > int(int(self.__profile['stepper']['total_steps_in_stroke']))-int(initial_speed['speed_change_range_steps']) and step_count < int(self.__profile['stepper']['total_steps_in_stroke']):
 
                working_wait_time = working_wait_time * initial_speed['speed_change_factor']

            # Once we get to the final step in the stroke we change directions and evaluate if we change speed.
            elif int(step_count) == int(self.__profile['stepper']['total_steps_in_stroke']):

                # We reset the step count and bump up the switch and current stroke count
                step_count = 0
                switch_count += 1
                current_stroke += 1

                # We Change the direction at the end of each stroke
                turn_left = not turn_left

                # We handle interrupts so that we end in the same place we started.
                if turn_left and self.interrupted:
                    break

                GPIO.output(self.__profile['stepper']['direction_pin'], turn_left)
                sleep(initial_speed['direction_change_sleep'])

                # If we reach the end of the current random set of strokes we set a new random set.
                if current_stroke == current_stroke_goal:
                    initial_speed_key = choice(list(speeds.keys()))
                    initial_speed = speeds[initial_speed_key]
                    wait_time = initial_speed['step_sleep']
                    working_wait_time = wait_time
                    current_stroke_goal = randint(initial_speed['min_random_stroke'], initial_speed['max_random_stroke'])
                    current_stroke = 0
            else:
                # We should never here but added for completeness
                continue

        # If set we lock the arm in place is wanted
        if not lock_after_done:
            GPIO.output(self.__profile['stepper']['enable_pin'], True)

    def specified_stroke_profile(self, speed: str, thrust_step_depth: int, total_stroke_goal: int = 16364, lock_after_done: bool = True):
        """
        Sets the speed of the arm to a given speed
        Args:
            total_stroke_goal: int: How many strokes we want to do. Insertion and withdraw would be two strokes
            lock_after_done: bool: if we want to lock the arm in place when done (default False)
            speed: int: speed profilelock_after_done

        Returns:

        """

        # We turn on the stepper motor (enable held low turns it on)
        GPIO.output(self.__profile['stepper']['enable_pin'], False)

        # For safety reasons first stroke should always be a withdraw. We preset the stepper now
        turn_left = True
        GPIO.output(self.__profile['stepper']['direction_pin'], turn_left)

        # Out step and switch counts
        step_count = 0
        switch_count = 0

        # We get our wait time and error if we cant
        try:
            wait_time = self.__profile['speeds'][str(speed)]['step_sleep']
            speed_change_ramp = self.__profile['speeds'][str(speed)]['step_sleep']
            total_steps_in_stroke = thrust_step_depth
            speed_change_factor = self.__profile['speeds'][str(speed)]['speed_change_factor']
            direction_change_sleep = self.__profile['speeds'][str(speed)]['direction_change_sleep']
        except KeyError as k:
            raise Exception(f'Speed must be one of {list(self.__profile["speeds"].keys())} with current profile, {k}')

        working_wait_time = wait_time

        # The main stroke loop.
        while switch_count < total_stroke_goal:

            # This block is the heart of the action one set pin to high
            # then low moves the stepper motor forward one step.
            # We increment the step count then sleep. The sleep time controls the speed of the motor
            GPIO.output(self.__profile['stepper']['step_pin'], True)
            GPIO.output(self.__profile['stepper']['step_pin'], False)
            step_count += 1
            sleep(working_wait_time)

            # Here is when the logic happens. We decide what to do based on what step we are on.
            if step_count <= speed_change_ramp:
                # If we are in the first n steps we speed up by decreasing the sleep time
                working_wait_time = working_wait_time / speed_change_factor

                # Floating point math causes things to slowly slow down over time, but Decimal math is too slow to do
                # in this loop. A nice solution is to just reset things every stroke.
                if step_count == speed_change_ramp:
                    working_wait_time = wait_time

            # We slow down for the last n steps
            elif step_count > int(total_steps_in_stroke)-int(speed_change_ramp):
                working_wait_time = working_wait_time * speed_change_factor
            # Once we get to the final step in the stroke we change directions and evaluate if we change speed.
            elif step_count == total_steps_in_stroke:
                # We reset the step count and bump up the switch and current stroke count
                step_count = 0
                switch_count += 1

                # We Change the direction at the end of each stroke
                turn_left = not turn_left

                if turn_left and self.interrupted:
                    break

                GPIO.output(self.__profile['stepper']['direction_pin'], turn_left)
                sleep(direction_change_sleep)

            else:
                # We should never here but added for completeness
                continue

        # If set we lock the arm in place is wanted
        if not lock_after_done:
            GPIO.output(self.__profile['stepper']['enable_pin'], True)

    def set_arm_lock(self, is_locked: bool = False):
        """
        Locks or unlocks the arm.
        Args:
            is_locked: bool: Setting to true will lock, fase will unlock

        Returns: None

        """
        GPIO.output(self.__profile['stepper']['enable_pin'], not is_locked)
