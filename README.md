# platformio-linux-setup
Installs and initializes [PlatformIO][1] on a debian/ubuntu based linux system.

The script currently
- adds the current user to the tty and dialout groups to access ttyUSB
- adds the [99-platformio-udev.rules][2]
- installs python3
- installs [shell commands][3] by adding the binary path of platformio in the users .profile file

[1]: https://platformio.org/
[2]: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
[3]: https://docs.platformio.org/en/latest/core/installation.html#method-1