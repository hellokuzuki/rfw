from robot.api.deco import keyword
def my_keywords(self, arg):
		return self._helper_method(arg)

def _helper_method(self, arg):
		return arg.upper()

@keyword('My Hello World')
def hello(name):
		return "Hello, %s!" % name