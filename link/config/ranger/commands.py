import os
import shutil
import subprocess

from ranger.api.commands import Command
from ranger.core.loader import CommandLoader


class paste_as_root(Command):
    def execute(self):
        if self.fm.do_cut:
            self.fm.execute_console("shell sudo mv %c .")
        else:
            self.fm.execute_console("shell sudo cp -r %c .")


class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        # match files
        if shutil.which("fd"):
            command = "fd --type f --follow --exclude .git | fzf +m --reverse"
        else:
            command = "find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse"
        fzf = self.fm.execute_command(command, text=True, stdout=subprocess.PIPE)
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(fzf.stdout.readline().rstrip("\n"))
            self.fm.select_file(fzf_file)


class compress(Command):
    def execute(self):
        """Compress marked files to current directory"""
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(
            args=["apack"]
            + au_flags
            + [os.path.relpath(f.path, cwd.path) for f in marked_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)


class extracthere(Command):
    def execute(self):
        """Extract copied files to current directory"""
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ["-X", cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ["-e"]

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(
            args=["aunpack"] + au_flags + [f.path for f in copied_files],
            descr=descr,
            read=True,
        )

        obj.signal_bind("after", refresh)
        self.fm.loader.add(obj)
