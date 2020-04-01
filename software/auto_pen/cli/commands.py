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

import os
import click
from appdirs import user_config_dir

from auto_pen.cli.configuration import built_in_profiles
from auto_pen.cli.supporting_functions import verify_configuration, set_fs_read_only, check_fs_read_only
from auto_pen.core.Core import StepperInterface


@click.command(help='Start thrusting with a user defined static speed')
@click.option('--speed', '-s', type=str, help=f'Set Thrust Speed')
@click.option('--get_list', '-l', is_flag=True, help=f'List Thrust Speed Options')
@click.option('--thrust', '-t', type=int, help=f'How many STEPS to thrust (Default Profile Max)')
def static(speed, get_list, thrust):

    # Before we do anything we make sure we have a valid profile
    profile = verify_configuration()

    # If we get a list of speeds we grab it from the active profile
    if get_list:
        for k, v in profile['speeds'].items():
            click.echo(f'{k} = {v["human_description"]}')

    else:
        # We check for a valid speed and thrust.
        if thrust is None:
            thrust = profile['stepper']['total_steps_in_stroke']
        else:
            if thrust > profile['stepper']['total_steps_in_stroke']:
                click.echo(f'Thrust depth of {thrust} steps is out of range of current profile. Must be {profile["stepper"]["total_steps_in_stroke"]} or lower.')
                exit()

        speed_list = list(profile['speeds'].keys())
        if speed in speed_list:
            # We start penetration
            click.echo("Starting Now Ctrl-C to stop")
            ctl = StepperInterface(profile)
            ctl.specified_stroke_profile(speed, thrust)
            click.echo('Done')
        else:
            click.echo(f'Specified speed must be one of {speed_list} Try --help to get details.')


@click.command(help='Start thrusting with random speeds with random thrust counts ')
@click.option('--thrust', '-t', type=int, help=f'How many STEPS to thrust (Default Profile Max)')
def random(thrust):

    # Before we do anything we make sure we have a valid profile
    profile = verify_configuration()

    if thrust is None:
        thrust = profile['stepper']['total_steps_in_stroke']
    else:
        if thrust > profile['stepper']['total_steps_in_stroke']:
            click.echo(
                f'Thrust depth of {thrust} steps is out of range of current profile. Must be {profile["stepper"]["total_steps_in_stroke"]} or lower.')
            exit()

    # Here we go
    click.echo("Starting Now Ctrl-C to stop")
    ctl = StepperInterface(profile)
    ctl.random_stroke(thrust)
    click.echo('Done')


@click.command(help='Lock the dildo in place - useful for mounting')
def lock():
    # Before we do anything we make sure we have a valid profile
    profile = verify_configuration()
    ctl = StepperInterface(profile=profile)
    ctl.set_arm_lock(True)
    click.echo('Penetration Arm Locked')


@click.command(help='Unlock the dildo - useful for repositioning')
def unlock():
    # Before we do anything we make sure we have a valid profile
    profile = verify_configuration()
    ctl = StepperInterface(profile=profile)
    ctl.set_arm_lock(False)
    click.echo('Penetration Arm Unlocked')


@click.command(help='Configure This Tool')
@click.option('--get_list', '-l',  help='List available penetration profiles', is_flag=True)
@click.option('--set_profile', '-s', type=str, help='Set Profile')
def configure(get_list, set_profile):
    """
    This function allows the user to set a profile from the known profiles.
    This function writes the selected profile to a directory for later use.
    :param get_list: a flag to get the list
    :param set_profile: str: the proposed profile to set to
    :return:
    """
    if get_list is False and set_profile is None:
        click.echo('One option must be specified see --help for help')

    if get_list:
        for k, v in built_in_profiles.items():
            click.echo(f'{k}: {v["human_description"]}')
    elif set_profile is not None:
        if set_profile not in built_in_profiles.keys():
            click.echo(f'{set_profile} is an unknown profile. profile must be one of {list(built_in_profiles.keys())}')
        else:

            # Before we write data we want to make sure the fs is writeable
            fs_changed = False
            if check_fs_read_only():
                set_fs_read_only(False)
                fs_changed = True

            # We make out dir if it does not exist
            config_dir = user_config_dir('auto_pen')
            if not os.path.exists(config_dir):
                os.makedirs(config_dir)

            # We write our file
            with open(os.path.join(config_dir, 'current_auto_pen_profile'), 'w') as conf_file:
                conf_file.write(set_profile)
                click.echo('Penetration Profile Set')

            # We want to remark the fs as ro
            if fs_changed:
                set_fs_read_only(True)

