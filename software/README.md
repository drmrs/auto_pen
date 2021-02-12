# Auto Pen Control
This set of tools is designed to allow for the easy management of of home made automatic penetration machines.

While this script is tested against and is designed for the machine described in this repo there is no reason why it would not work with other pulse controlled stepper motor based devices.

# Assumptions
1. This document assumes you have Raspbian light installed. 
2. You can SSH into the machine and have networking set up.

## Important Note
After you are done setting up your Pi it is highly recommended that you put your Pi in "read-only" mode. This will ensure that your system will remain stable over time.

The adafruit provided script can be found [here](https://learn.adafruit.com/read-only-raspberry-pi/)

Once your Pi is in read-only mode you could enable writes temporarily via the `sudo mount -o remount,rw /` in order to make changes.

## Install

1. Make sure Python3 and pip3 are installed on your system.
    - Debian/Raspbian - `sudo apt-get install python3 python3-pip`
2. Make sure you are in the `software` subdirectory of the project.
3. Install the auto_pen software.
    - `pip3 install .`
4. Open a new shell instance and verify that the install was successful by running the command `auto_pen --help` command

```shell script
auto_pen --help
Options:
  --help  Show this message and exit.

Commands:
  configure  Configure This Tool
  lock       Lock the dildo in place - useful for mounting
  random     Start thrusting with random speeds with random thrust counts
  static     Start thrusting with a user defined static speed
  unlock     Unlock the dildo - useful for repositioning

```

## Configuration

Before anything will work you need to configure the software. After you do this the rest of the commands should work.

The `auto_pen` software works via set profiles. Right now profiles are managed as part of the package as native python dictionaries. There are future plans to add dynamically loaded yaml profiles.

Profiles are hardware specific. The included profile `raspberry_pi_1_1600_step_rev_rt` assumes that you are using a raspberry pi 1 with a 1600 step/revolution stepper motor, and that the code is operating with real time priority along with other technical details.

While the `raspberry_pi_1_1600_step_rev_rt` should work on newer Raspberry Pi's it is untested and is almost certainly will not be taking advantage of the hardware. (i.e. for faster penetration speeds. etc.)

You can list and set a profile via the cli.

```shell script
auto_pen configure --help

  Configure This Tool

Options:
  -l, --get_list          List available penetration profiles
  -s, --set_profile TEXT  Set Profile
  --help                  Show this message and exit.

```

If you want help configuring a profile open an issue and you should get help.

## Usage

There are presently two modes and a lock/unlock option.

You can lock and unlock the arm via the `auto_pen lock` and `auto_pen unlock` commands. Before you begin make sure that the penetration arm is locked in the fully extended position. The first motion will always be a retraction. THis is to ensure that the arm does not penetrate further then would be safe.

### Static Mode
In this mode the arm penetrates at a static speed as set in your current profile.

You can list the available speeds along with a description via the following options

```shell script
auto_pen static --help

  Start thrusting with a user defined static speed

Options:
  -s, --speed TEXT  Set Thrust Speed
  -l, --get_list    List Thrust Speed Options
  --help            Show this message and exit.
```

Presently this mode is set to continue on til you `Ctrl-C` it or reach 16k strokes, whatever comes first. WHen you do `Ctrl-C` out the arm will reset to the original fully extended locked position before the program exits. 

### Random Mode
Random mode will have the arm change penetration speed every n strokes where n is a random number between the min and max defined speed parameters in the currently loaded profile.

```shell script
auto_pen random
```

Presently this mode is set to continue on til you `Ctrl-C` it or reach 16k strokes, whatever comes first. WHen you do `Ctrl-C` out the arm will reset to the original fully extended locked position before the program exits. 

## Contribution

Contributions are welcome in any form and PRs will generally be accepted.

Adding profiles for newer Raspberry Pi's is welcome along with new feature requests.

Feel free to reach out or (preferably) open an issue.
