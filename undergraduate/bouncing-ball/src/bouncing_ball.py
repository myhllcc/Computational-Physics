"""
Title: first asignment: Bouncy ball

This program is used to calculate the number of bounces over a given height and
the time the ball takes to complete the bounces.

Yunhao Mo(10455467) 30/10/2020
"""

import numpy as np
import matplotlib.pyplot as plt

GRAVITATIONAL_ACCELERATION = 9.81
JUDGE_INPUT = True

def find_time(time, last_height):
    '''
    Calculate times when height is 0 for each parabola.
    Parameters
    ----------
    time : float
    last_height : float
    Returns
    -------
    time : float
    '''
    start_time = time[-1, 1]
    end_time = 2 * np.sqrt(2 * last_height / GRAVITATIONAL_ACCELERATION) + start_time
    time = np.append(time, [[start_time, end_time]], axis=0)
    return time

def plotgraph(time_interval, max_height):
    '''
    Plot graph for each parabola
    Parameters
    ----------
    time_interval : float array
    max_height : float
    '''
    start_time, end_time = time_interval
    middle_time = 0.5 * (start_time + end_time)
    time = np.linspace(start_time, end_time, 50)
    height = -0.5 * GRAVITATIONAL_ACCELERATION * (time - middle_time)**2 + max_height
    plt.plot(time, height)

def _input(name, judge_input):
    '''
    Input number of each variable and test if the number is right.
    Parameters
    ----------
    name : string
        the variable name
    judge_input : bool
        To test if the input is right.

    Returns
    -------
    input_number : float
    judge_input : bool
    '''
    try:
        input_number = float(input('Please input {0}'.format(name)))
        if input_number <= 0:
            judge_input = False
            print('{0} should be greater than 0'.format(name))
            return None, judge_input
        if name == 'Efficiency' and input_number >= 1:
            judge_input = False
            print('Efficiency should be smaller than 1')
            return None, judge_input
        return input_number, judge_input
    except ValueError:
        print('{0} should be a number'.format(name))
        judge_input = False
        return None, judge_input

def make_figure_beautiful():
    '''
    Plot the minimum height line.
    '''
    x_minimum_height = np.linspace(0, time_array[-1, 1], 50)
    y_minimum_height = 0 * x_minimum_height + MINIMUM_HEIGHT
    plt.plot(x_minimum_height, y_minimum_height, 'r--')
    plt.xlim(0, time_array[-1, 1])
    plt.xlabel('Time (s)')
    plt.ylabel('Height (m)')
    line_x = time_array[-1, 1] - 0.5
    line_y = MINIMUM_HEIGHT + 0.5
    plt.annotate('Minimum height is {0} m'.format(MINIMUM_HEIGHT), xy=(line_x, line_y))

def find_height(max_height, efficiency):
    '''
    Returns the maximum height the ball can reach in each motion
    Parameters
    ----------
    max_height : float array
    efficiency : float

    Returns
    -------
    max_height : float array

    '''
    new_height = max_height[-1] * efficiency
    max_height = np.append(max_height, new_height)
    return max_height

def extra_information():
    '''
    Give Maximum heights and the time for the ball to reach it if user want.
    '''
    print('Do you want to know the maximum height and the time of it?')
    answer = input('Pleas input yes or no :')
    if answer == 'yes':
        counter = 0
        for entry in max_height_array:
            print('Bounce {0}: Maximum height: {1:0.2f} m'.format(counter, entry))
            time_max_height = (time_array[counter, 0] + time_array[counter, 1]) / 2
            print('Time: {0:0.2f} s '.format(time_max_height))
            counter += 1
    elif answer == 'no':
        print('OK thank you')
    else:
        print('Please input yes or no')

INITIAL_HEIGHT, JUDGE_INPUT = _input('Initial height', JUDGE_INPUT)
MINIMUM_HEIGHT, JUDGE_INPUT = _input('Minimum height', JUDGE_INPUT)
EFFICIENCY, JUDGE_INPUT = _input('Efficiency', JUDGE_INPUT)
if JUDGE_INPUT:
    max_height_array = np.array([INITIAL_HEIGHT])
    first_end_time = np.sqrt(2 * INITIAL_HEIGHT / GRAVITATIONAL_ACCELERATION)
    time_array = np.array([[-first_end_time, first_end_time]])
    NUMBER_OF_BOUNCES = 0
    plotgraph(time_array[0], max_height_array[0])
    while max_height_array[-1] > MINIMUM_HEIGHT:
        NUMBER_OF_BOUNCES += 1
        max_height_array = find_height(max_height_array, EFFICIENCY)
        time_array = find_time(time_array, max_height_array[-1])
        plotgraph(time_array[-1], max_height_array[-1])
    make_figure_beautiful()
    plt.show()
    if NUMBER_OF_BOUNCES == 0:
        print("Number of bounces is 0. no bounces over {0} m".format(MINIMUM_HEIGHT))
    else:
        print('Number of bounces is {0}'.format(NUMBER_OF_BOUNCES))
        print('time to complete the the bounces is {0:0.2f} s'.format(time_array[-2, 1]))
        extra_information()
