local triggers = {
		'^/(start)$',
		'^/(contact) (.+)$',
		'^/(pm) (%d+)', 
		'^###cb:/(langfa)',
		'^###cb:/(langen)',
		'^###cb:/(langar)',
		'^/(about)$',
		"^/(help)$"
}
	
local action = function(msg, matches)

if matches[1] == 'start' then
local text = 'Hi 👋 '..msg.from.first_name..'\nplease select yor language *Please send /help* 😊\n-------------\nسلام 👋  '..msg.from.first_name..'\nلطفا زبان خود را انتخاب کنید لطفا دستور /help را برای من ارسال کنید\n-------------\nمرحبا 👋 '..msg.from.first_name..'\nالرجاء اختيار اللغة الخاصة بك ، يرجى الأمر /help تقدم لي'
	keyboard = {} -- Array Of Keyboard
	keyboard.inline_keyboard = {
	   {
			{text = "🇬🇧English", callback_data="/langen"},
			{text = "🇮🇷Persian", callback_data="/langfa"},
			{text = "🇮🇶Arabic", callback_data="/langar"},
	   }
	}

	api.sendChatAction(msg.chat.id, 'typing')
	api.sendKeyboard(msg.chat.id, text, keyboard, true)
	end
if matches[1] == 'about' then
local text = '`Ver Bot` *1.5*\n *Thanks* [BeyondTeam](https://telegram.me/BeyondTeam) *And *[Mohammad](https://telegram.me/CRUEL) *for helping,and other friends*'
    local keyboard = {}
    keyboard.inline_keyboard = {
	   {
			{text = "Editor Bot", url = "https://telegram.me/L_U_A"},
			{text = "Channel Team", url = "https://telegram.me/MuteHack"},
	   },
	   {
	        {text = "Beyond Team", url = "https://telegram.me/BeyondTeam"},
	   }
	 }
	api.sendKeyboard(msg.chat.id, text, keyboard, true)
   end
if matches[1] == 'help' then
text = ([[`Hi, am grateful of your choice
Please check the desired language for menu, choose
Please text for translation submit
Please check your language for translation select.
Please recipes /about to get on I can send.`]])
api.sendMessage(msg.chat.id, text, true)
end
	if msg.cb then
        local text = ''
        local text1 = ''
        if matches[1] == 'langfa' then
			text1 = 'زبان تنظیم شد!'
            text = 'دوست عزیز '..msg.from.first_name..' به ربات ترجمه خوش اومدی 😊🌹\nبرای ترجمه کلمه یا جمله فقط کافیه متنتو برای ما بفرستی'
			client:set('UserLnag'..msg.from.id, 'FA')
        end
		if matches[1] == 'langen' then
			text1 = 'Language Set!'
		    text = [[Welcome my friend 
please send your text for translate]]
			client:set('UserLnag'..msg.from.id, 'EN')
			end
		if matches[1] == 'langar' then
		    text1 = 'لغة كان.'
			text  = [[العزيز روبوت الترجمة نرحب الفضيحة إلى ترجمة كلمة أو الهجوم فقط متنتو بالنسبة لنا.]]
			client:set('UserLnag'..msg.from.id, 'AR')
			end
		api.sendChatAction(msg.chat.id, 'typing')
        api.editMessageText(msg.chat.id, msg.message_id, text1)
        api.sendMessage(msg.chat.id, text, true)
	end

if matches[1] == 'contact' and matches[2] then

api.sendChatAction(msg.chat.id, 'typing')
api.sendMessage(msg.chat.id, '*Sent!*', true)

api.sendChatAction(msg.chat.id, 'typing')
api.forwardMessage(config.admin, msg.from.id, msg.message_id)
end

if is_admin(msg) and matches[1] == 'pm' and matches[2] and matches[3] then
local is_member = client:sismember('BcUsernames', matches[2])

if is_member then
api.sendChatAction(matches[2], 'typing')
api.sendMessage(matches[2], '#New Message\n'..matches[3], true)

api.sendChatAction(msg.chat.id, 'typing')
api.sendReply(msg, '*Sent For '..matches[2]..'*', true)
else
api.sendChatAction(msg.chat.id, 'typing')
api.sendReply(msg, '*I Can Not Send Any Messages To This User!*', true)
end

end

end

return {
  action = action,
  triggers = triggers,
}