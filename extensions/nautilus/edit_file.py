from gi.repository import GObject, Nautilus
from subprocess import Popen

terminal = "kitty"
editor = "nvim"

class EditFileInTextEditor(GObject.GObject, Nautilus.MenuProvider):

	def edit_file(self, menu, file):
		if file.can_write():
			file_path = file.get_location().get_path()
			Popen([terminal, "--hold", editor, file_path])
		if not file.can_write():
			file_path = file.get_location().get_path()
			Popen([terminal, "--hold", "-e", "env", f"SUDO_EDITOR={editor}", "sudoedit", file_path])

	def get_file_items(self, *args):
		selected = args[-1]
		if len(selected) != 1:
			return[]
		
		file = selected[0]
		if file.is_directory():
			return[]

		item = Nautilus.MenuItem(
			name="EditFileInTextEditor::Edit",
			label=f"Edit with {editor.capitalize()}"
		)

		item.connect("activate", self.edit_file, file)
		return[item]
