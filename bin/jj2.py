#!/usr/bin/env python
#
# Copyright (c) 2008-2014 Miki Tebeka <miki@mikitebeka.com>
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the "PythonWise" blog nor the names of its contributors
#   may be used to endorse or promote products derived from this software without
#   specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

'''Command line for expanding Jinja2 templates.
Template variables can be passed either via the command line (using -vX=Y) or
via a JSON/YAML configuration file (using -i /path/to/vars.json)
Example:
    $ echo 'Hello {{name}}' > template.txt
    $ jj2.py -v name=Bugs template.txt
    Hello Bugs
    $
'''

import jinja2
import json


def load_vars(filename):
    with open(filename) as fo:
        if filename.lower().endswith('.json'):
            return json.load(fo)
        elif filename.lower().endswith('.yaml'):
            import yaml  # Lazy import
            return yaml.load(fo)
        else:
            raise ValueError('unknown file type: {}'.format(filename))


def parse_cmdline_vars(cmdline_vars):
    return dict(var.split('=', 1) for var in cmdline_vars)


def main(argv=None):
    import sys
    from argparse import ArgumentParser, FileType

    argv = argv or sys.argv

    parser = ArgumentParser(description='Expand Jinja2 template')
    parser.add_argument('template', help='template file to expand',
                        type=FileType('r'), nargs='?', default=sys.stdin)
    parser.add_argument('--var', '-v', action='append',
                        help='template variables (in X=Y format)')
    parser.add_argument('--output', '-o', help='output file',
                        type=FileType('w'), nargs='?', default=sys.stdout)
    parser.add_argument('--vars-file', '-i', help='vars files (YAML or JSON)',
                        nargs='?')

    args = parser.parse_args(argv[1:])

    tvars = {}
    if args.vars_file:
        tvars.update(load_vars(args.vars_file))

    tvars.update(parse_cmdline_vars(args.var or []))

    # Fail on undefined
    env = jinja2.Environment(undefined=jinja2.StrictUndefined, loader=jinja2.FileSystemLoader('.'))

    template = env.from_string(args.template.read())

    args.output.write(template.render(tvars))


if __name__ == '__main__':
    main()
