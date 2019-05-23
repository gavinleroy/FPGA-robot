# digitalCircuitFPGARobot
Final project for digital circuits, fpga robot coded in verilog

-The files in this repository are just .v extension and the bit file needed for the robot.

-To copy this project download and add the .v files to a new project in ise or vivado.

-The robot needs an ultrasonic sensor (arduino model used in my project), two servo motors for the wheels, 
a soundbox, infared sensor, and a Digilent Basys2-Basys3 board.  Your constraints file will need to reflect which board and environemt
you are using.

-Our Robot was controlled by a Sony tv remote, my partner did not decode the remote signal but rather counted the wavelength 
coming in.  An improvement on the project would be to decode the signal coming in making it a more accurate reading.
