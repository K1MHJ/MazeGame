#pragma once

#include "PlatformDetection.h"

#ifdef PLATFORM_WINDOWS
	#ifndef NOMINMAX
		#define NOMINMAX
	#endif
#endif

#include <iostream>
#include <memory>
#include <utility>
#include <algorithm>
#include <functional>

#include <string>
#include <sstream>
#include <array>
#include <vector>
#include <unordered_map>
#include <unordered_set>

#include "Base.h"
#include "Log.h"
#include "Instrumentor.h"

#ifdef PLATFORM_WINDOWS
	#include <Windows.h>
#endif
