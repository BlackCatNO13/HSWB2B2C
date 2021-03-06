using Hishop.Weixin.MP;
using Hishop.Weixin.MP.Request;
using System;
using System.Runtime.CompilerServices;

namespace Hishop.Weixin.MP.Request.Event
{
	public class ScanEventRequest : EventRequest
	{
		public override RequestEventType Event
		{
			get
			{
				return RequestEventType.Scan;
			}
			set
			{
			}
		}

		public string EventKey
		{
			get;
			set;
		}

		public string Ticket
		{
			get;
			set;
		}

		public ScanEventRequest()
		{
		}
	}
}