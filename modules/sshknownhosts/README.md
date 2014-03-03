# sshknownhosts


## Installation

Copy `sshknownhosts` to `$ANSIBLE_LIBRARY` on the management host.

        install -m 444 sshknownhosts $ANSIBLE_LIBRARY/sshknownhosts


## Usage

        sshknownhosts
                host= host1.domain.com
                state= present|absent (default: present)
                keyscan= /path/to/ssh-keyscan (default: use PATH)
                dest= /path/to/ssh_known_hosts (default: /etc/ssh/ssh_known_hosts)
                enctype= rsa|dsa (default: rsa)


## Playbook

        - name: Add localhost to ssh_known_hosts file
          action: sshknownhosts host=localhost state=present

        - name: Add several hosts to ssh_known_hosts file
          action: sshknownhosts host=${item} state=present
          with_items:
            - host1.example.com
            - host2.example.com
            - host3.example.com



## Security

If an ssh_known_hosts file is constructed using ssh-keyscan without
verifying the keys, users will be vulnerable to man in the middle
attacks.  On the other hand, if the security model allows such a risk,
ssh-keyscan can help in the detection of tampered keyfiles or man in
the middle attacks which have begun after the ssh_known_hosts file was
created.

(taken from the ssh-keyscan man page)


## Possible Future Enhancements

- aliases: adding aliases for hosts.  They end up in the known hosts
  file like this: host1,alias1,alias2 sshkey
- as an alternative to supplying a host or list of hosts, get the list
  of hosts from the existing ssh_known_hosts file and re-scan for
  updates.
- key: supplying the host key from a string or file instead of looking
  it up with the ssh-keyscan program.
- ssh information: use configuration items for ssh used by the
  ssh-keyscan program such as port number, or IPv4/IPv6 addresses.
- allow multiple key types (rsa and dsa together, for example)

Feedback on these and other options would be appreciated.


## Notes

* A module I wrote for my own use that others might find useful, so I
  added some docs and put it up on github.
* This is my first python program, so I appreciate some feedback (and
  my first public ansible module)
* Tested on Debian flavours (Mint 14, Debian Sid and XUbuntu 12.10 and
  13.04) and OpenBSD 5.2.
* Contact me at https://www.bfmartin.ca/contact/
