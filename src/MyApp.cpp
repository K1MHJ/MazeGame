#include "EntryPoint.h"

class MyApp : public Application
{
public:
	MyApp(const ApplicationSpecification& specification)
		: Application(specification)
	{
		// PushLayer(new ExampleLayer());
	}

	~MyApp()
	{
	}
};

Application* CreateApplication(ApplicationCommandLineArgs args)
{
	ApplicationSpecification spec;
	spec.Name = "MyApp";
	spec.WorkingDirectory = "./bin";
	spec.CommandLineArgs = args;

	return new MyApp(spec);
}
