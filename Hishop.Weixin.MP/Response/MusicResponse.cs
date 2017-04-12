using Hishop.Weixin.MP;
using Hishop.Weixin.MP.Domain;
using System;
using System.Runtime.CompilerServices;

namespace Hishop.Weixin.MP.Response
{
	public class MusicResponse : AbstractResponse
	{
		public override ResponseMsgType MsgType
		{
			get
			{
				return ResponseMsgType.Music;
			}
		}

		public Hishop.Weixin.MP.Domain.Music Music
		{
			get;
			set;
		}

		public MusicResponse()
		{
		}
	}
}