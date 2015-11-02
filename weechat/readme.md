I'd like to check in my weechat config, but unfortunately weechat tends to modify lots of stuff in this folder
a lot. So I'll record the list of steps to set up weechat in the desired fashion.

http://dev.weechat.org/post/2011/08/28/Beautify-your-WeeChat

* /script update
* /script upgrade
* /script install beep.pl isgd.pl listbuffer.py update_notifier.py buffers.pl
* /set irc.look.smart_filter on
* /filter add irc_smart * irc_smart_filter *
* /set weechat.color.chat_nick_colors "cyan,magenta,green,brown,lightblue,default,lightcyan,lightmagenta,lightgreen,blue,31,35,38,40,49,63,70,80,92,99,112,126,130,138,142,148,160,162,167,169,174,176,178,184,186,210,212,215,247"
* /set weechat.look.prefix_suffix "│"
* /set weechat.look.read_marker_string "─"
* /set weechat.look.prefix_join "▬▬▶"
* /set weechat.look.prefix_quit "◀▬▬"
* /set weechat.look.item_buffer_filter "•"
* /set weechat.look.bar_more_down "▼"
* /set weechat.look.bar_more_left "◀"
* /set weechat.look.bar_more_right "▶"
* /set weechat.look.bar_more_up "▲"
* /set weechat.look.buffer_time_format "${color:252}%H${color:245}%M${color:240}%S"
* /set weechat.bar.title.color_bg 60
* /set weechat.bar.status.color_bg 60
* /set weechat.color.chat_delimiters 29
* /set weechat.color.chat_host 24
* /set weechat.color.chat_prefix_suffix 24
* /set weechat.color.nicklist_away 244
* /set weechat.color.separator 60
* /set irc.color.reason_quit  244
* /set irc.color.topic_new  36
* /set irc.color.topic_old 244



* /server add aa Gemini.panicbnc.net/1337
* /set irc.server.aa.nicks "johnhamelink,johnhamelink_,johnhamelink__,johnhamelink___"
* /set irc.server.aa.username "johnhamelink"
* /set irc.server.aa.realname "John Hamelink"
* /set irc.server.aa.password "johnhamelink/zje:<password>"

* /server add oftc Gemini.panicbnc.net/1337
* /set irc.server.oftc.nicks "johnhamelink,johnhamelink_,johnhamelink__,johnhamelink___"
* /set irc.server.oftc.username "johnhamelink"
* /set irc.server.oftc.realname "John Hamelink"
* /set irc.server.oftc.password "johnhamelink/oftc:<password>"

* /server add freenode Gemini.panicbnc.net/1337
* /set irc.server.freenode.nicks "johnhamelink,johnhamelink_,johnhamelink__,johnhamelink___"
* /set irc.server.freenode.username "johnhamelink"
* /set irc.server.freenode.realname "John Hamelink"
* /set irc.server.freenode.password "johnhamelink/freenode:<password>"

* /server add panic Gemini.panicbnc.net/1337
* /set irc.server.panic.nicks "johnhamelink,johnhamelink_,johnhamelink__,johnhamelink___"
* /set irc.server.panic.username "johnhamelink"
* /set irc.server.panic.realname "John Hamelink"
* /set irc.server.panic.password "johnhamelink/EsperNet:<password>"
