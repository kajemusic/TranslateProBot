local triggers = {
		'^(.*)$',
}

local action = function(msg, matches)
local lang = client:get('UserLnag'..msg.from.id)

if not lang then return false end

if msg.text then

if lang == 'EN' then
		local keyboard = {}
        keyboard.inline_keyboard = {
    	    {
    		    {text = "🇮🇷Persian", callback_data = '/fa'},
				{text = "🇬🇧English", callback_data = '/en'},
	    	},    	    
			{
				{text = "🇫🇷French", callback_data = '/fr'},
				{text = "🇷🇺Russian", callback_data = '/ru'},
	    	},			
			{
    		    {text = "🇮🇶Arabic", callback_data = '/ar'},
				{text = "🇨🇳Chinese", callback_data = '/zh'},
	    	},
			{
				{text = "🇯🇵Japanese", callback_data = '/ja'},
				{text = "🇩🇪German", callback_data = '/de'},
	    	},
			{
				{text = "🇪🇸Spanish", callback_data = '/es'},
				{text = "🇹🇷Turkish", callback_data = '/tr'},
	    	},			
			{
				{text = "🇮🇹Italy", callback_data = '/it'},
				{text = "🇷🇴Romanian", callback_data = '/ro'},
			},
			{
				{text = "🇦🇲Armenia", callback_data = '/am'},
			},
			{
			    {text = "🇦🇿Azerbaijani", callback_data = '/az'},
				{text = "Rate 5 star now⭐️", url = 'https://telegram.me/storebot?start=TranslateProBot'},
			},
			{
			    {text = "😉Join Channel", url = 'https://telegram.me/BeyondTeam'},
				{text = "🔙Exit", callback_data = '/exit'},
	    	},
    	}

client:set('Text'..msg.from.id, URL.escape(msg.text))
api.sendChatAction(msg.chat.id, 'typing')
api.sendKeyboard(msg.chat.id, 'Plesae Select Translating Language :', keyboard, true)
elseif lang == 'FA' then
		local keyboard = {}
        keyboard.inline_keyboard = {
    	    {
    		    {text = "فارسی🇮🇷", callback_data = '/fa'},
				{text = "انگلیسی🇬🇧", callback_data = '/en'},
	    	},    	    
			{
				{text = "فرانسوی🇬🇧", callback_data = '/fr'},
				{text = "روسی🇷🇺", callback_data = '/ru'},
	    	},			
			{
    		    {text = "عربی🇮🇶", callback_data = '/ar'},
				{text = "چینی🇨🇳", callback_data = '/zh'},
	    	},
			{
				{text = "ژاپنی🇯🇵", callback_data = '/ja'},
				{text = "آلمانی🇩🇪", callback_data = '/de'},
	    	},
			{
				{text = "اسپانیایی🇪🇸", callback_data = '/es'},
				{text = "ترکی🇹🇷", callback_data = '/tr'},
	    	},
			{
				{text = "ایتالیایی🇮🇹", callback_data = '/it'},
				{text = "رومانیایی🇷🇴", callback_data = '/ro'},
			},
			{
				{text = "ارمنی🇦🇲", callback_data = '/am'},
			},
			{
				{text = "آذربایجانی🇦🇿", callback_data = '/az'},
				{text = "همین حالا 5 ستاره به من بده⭐️", url = 'https://telegram.me/storebot?start=TranslateProBot'},
			},
			{
				{text = "😉ورود به کانال", url = 'https://telegram.me/BeyondTeam'},
				{text = "خروج🔙", callback_data = '/exit'},
	    	},
    	}

client:set('Text'..msg.from.id, URL.escape(msg.text))
api.sendChatAction(msg.chat.id, 'typing')
api.sendKeyboard(msg.chat.id, 'لطفا زبان ترجمه را انتخاب نمایید :', keyboard, true)
elseif lang == 'AR' then
		local keyboard = {}
        keyboard.inline_keyboard = {
    	    {
    		    {text = "🇮🇷الفارسي", callback_data = '/fa'},
				{text = "🇬🇧اللغة الإنجليزية", callback_data = '/en'},
	    	},    	    
			{
				{text = "🇫🇷الفرنسية", callback_data = '/fr'},
				{text = "🇷🇺الروسية", callback_data = '/ru'},
	    	},			
			{
    		    {text = "🇮🇶العربية", callback_data = '/ar'},
				{text = "🇨🇳الصينية", callback_data = '/zh'},
	    	},
			{
				{text = "🇯🇵اليابانية", callback_data = '/ja'},
				{text = "🇩🇪الألمانية", callback_data = '/de'},
	    	},
			{
				{text = "🇪🇸الإسبانية", callback_data = '/es'},
				{text = "🇹🇷التركية", callback_data = '/tr'},
	    	},			
			{
				{text = "🇮🇹إيطاليا", callback_data = '/it'},
				{text = "🇷🇴الرومانية", callback_data = '/ro'},
			},
			{
				{text = "🇦🇲أرمينيا", callback_data = '/am'},
			},
			{
			    {text = "🇦🇿أذربيجان", callback_data = '/az'},
				{text = "معدل 5 نجوم الآن⭐️", url = 'https://telegram.me/storebot?start=TranslateProBot'},
			},
			{
			    {text = "😉الانضمام إلى قناة", url = 'https://telegram.me/BeyondTeam'},
				{text = "🔙خروج", callback_data = '/exit'},
	    	},
    	}
		
client:set('Text'..msg.from.id, URL.escape(msg.text))
api.sendChatAction(msg.chat.id, 'typing')
api.sendKeyboard(msg.chat.id, 'من فضلك حدد ترجمة اللغة :', keyboard, true)

end

end

end

return {
  action = action,
  triggers = triggers,
}
