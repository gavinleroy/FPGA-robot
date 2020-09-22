### Digital Circuit FPGA Robot

FPGA remote-controled robot

  * The files in this repository are just .v extension and the bit file needed for the robot.

  * To copy this project download and add the .v files to a new project in ise or vivado.

  * The robot needs an ultrasonic sensor (arduino model used in my project), two servo motors for the wheels, 
a soundbox, infared sensor, and a Digilent Basys2-Basys3 board.  Your constraints file will need to reflect which board and environemt
you are using.

  * The Robot was controlled by a Sony tv remote, currently the remote signals are decoded using wavelength of received signal.  An improvement on the project would be to decode the signal coming in making it a more accurate reading.
