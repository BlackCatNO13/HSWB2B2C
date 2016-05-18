using System;

namespace Himall.Core.Plugins
{
	public class PluginNotFoundException : PluginException
	{
		public PluginNotFoundException(string pluginId) : base(string.Concat("未找到插件", pluginId))
		{
		}
	}
}