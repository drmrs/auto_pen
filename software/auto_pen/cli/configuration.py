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

built_in_profiles = {
    'raspberry_pi_1_1600_step_rev_rt': {
        'human_description': 'Raspberry Pi 1 with 1600 steps/revolution stepper executing in RealTime',
        'stepper': {
            'step_pin': 15,
            'direction_pin': 14,
            'enable_pin': 18,
            'total_steps_in_stroke': 1200

        },
        'speeds': {
            '1': {
                'step_sleep': 0.005,
                'min_random_stroke': 3,
                'max_random_stroke': 8,
                'speed_change_factor': 1.025,
                'speed_change_range_steps': 60,
                'direction_change_sleep': 0.05,
                'human_description': 'Very Slow'
            },
            '2': {
                'step_sleep': 0.0006,
                'min_random_stroke': 10,
                'max_random_stroke': 20,
                'speed_change_factor': 1.025,
                'speed_change_range_steps': 60,
                'direction_change_sleep': 0.05,
                'human_description': 'Slow'
            },
            '3': {
                'step_sleep': 0.00025,
                'min_random_stroke': 15,
                'max_random_stroke': 30,
                'speed_change_factor': 1.025,
                'speed_change_range_steps': 60,
                'direction_change_sleep': 0.05,
                'human_description': 'Medium'
            },
            '4': {
                'step_sleep': 0.00008,
                'min_random_stroke': 20,
                'max_random_stroke': 50,
                'speed_change_factor': 1.025,
                'speed_change_range_steps': 60,
                'direction_change_sleep': 0.05,
                'human_description': 'Fast'
            }
        }
    }
}
