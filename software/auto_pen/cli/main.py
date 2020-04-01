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

import click

from auto_pen.cli.commands import static, random, lock, unlock, configure


@click.group()
def cli():
    pass


cli.add_command(static)
cli.add_command(random)
cli.add_command(lock)
cli.add_command(unlock)
cli.add_command(configure)
