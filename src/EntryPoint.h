#pragma once

#include "Base.h"
#include "Application.h"
#include "Instrumentor.h"
#include <iostream>

extern Application* CreateApplication(ApplicationCommandLineArgs args);

int main(int argc, char** argv)
{
	Log::Init();

	PROFILE_BEGIN_SESSION("Startup", "HazelProfile-Startup.json");
	auto app = CreateApplication({ argc, argv });
	PROFILE_END_SESSION();

	PROFILE_BEGIN_SESSION("Runtime", "HazelProfile-Runtime.json");
	app->Run();
	PROFILE_END_SESSION();

	PROFILE_BEGIN_SESSION("Shutdown", "HazelProfile-Shutdown.json");
	delete app;
	PROFILE_END_SESSION();
  std::cout << "hello" << std::endl;
  return 0;
}
