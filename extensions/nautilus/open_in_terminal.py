from gi.repository import GObject, Nautilus
from subprocess import Popen

terminal = "kitty"

class OpenInTerminal(GObject.GObject, Nautilus.MenuProvider):
	
	def open_terminal_fg(self, menu, folder):
		path = folder.get_location().get_path()
		Popen([terminal, "--directory", path])

	def open_terminal_bg(self, menu, working_directory):
		path = working_directory.get_location().get_path()
		Popen([terminal, "--directory", path])


	def get_file_items(self, *args):
		selected = args[-1]
		if len(selected) != 1:
			return[]

		folder = selected[0]
		if not folder.is_directory():
			return[]


		item_fg = Nautilus.MenuItem(
			name="OpenInTerminal::Foreground",
			label="Open in Terminal"
		)

		item_fg.connect("activate", self.open_terminal_fg, folder)
		return[item_fg]



	def get_background_items(self, working_directory):
		item_bg = Nautilus.MenuItem(
			name="OpenInTerminal::Background",
			label="Open in Terminal"
		)

		item_bg.connect("activate", self.open_terminal_bg, working_directory)
		return[item_bg]








    
