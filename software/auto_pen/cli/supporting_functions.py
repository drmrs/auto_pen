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

from appdirs import user_config_dir
import os
import subprocess
import click

from auto_pen.cli.configuration import built_in_profiles


def verify_configuration():
    """
    Verifies that the configuration file exists and if it does it returns it.
    :return: dict: profile
    """
    alleged_path = os.path.join(user_config_dir('auto_pen'), 'current_auto_pen_profile')

    try:
        with open(alleged_path, 'r') as a_path:
            c_profile = a_path.read()

            if c_profile not in built_in_profiles.keys():
                click.echo(f'{c_profile} is an unknown profile. Something went wrong here. Did you mess with stuff?')
                exit()
            else:
                return built_in_profiles[c_profile]

    except FileNotFoundError as fnf:
        click.echo(f'Penetration profile not set. Have you configured one? Try --help, {fnf}')
        exit()


def check_fs_read_only():
    with open('/proc/mounts') as f:
        for line in f:
            device, mount_point, filesystem, flags, __, __ = line.split()
            flags = flags.split(',')
            if mount_point == '/':
                return 'ro' in flags
        raise ValueError('mount "%s" doesn\'t exist' % mnt)


def set_fs_read_only(ro_status: bool = True):
    if ro_status is True:
        stat = 'ro'
    else:
        stat = 'rw'

    subprocess.Popen(['mount', '-o', f'remount,{stat}', '/']).wait()
