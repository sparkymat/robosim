robosim
=======

Run 'rake console' for the interactive console. You can use the following commands:

  PLACE x,y,direction # x and y can be between 0 and 4 (inclusive). Direction is one of NORTH, EAST, SOUTH, WEST
  LEFT # This turns the robot left
  RIGHT # This turns the robot right
  MOVE # This moves the robot 1 cell forward (in the current direction). The robot does not move if it is at the edge of the board and would fall off.
  REPORT # This prints the current position and orientation of the robot.

After every command, if the robot has been placed on the board, the board will be displayed. All commands except PLACE are ignored, until a successful PLACE command has been executed.

You can see this help by running 'rake'.
