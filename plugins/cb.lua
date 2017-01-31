local triggers = {
		'^###cb:/(fa)',
		'^###cb:/(en)',
		'^###cb:/(fr)',
		'^###cb:/(ru)',
		'^###cb:/(ar)',
		'^###cb:/(zh)',
		'^###cb:/(ja)',
		'^###cb:/(de)',
		'^###cb:/(es)',
		'^###cb:/(exit)',
		'^###cb:/(tr)',
		'^###cb:/(it)',
		'^###cb:/(ro)',
		'^###cb:/(az)',
		'^###cb:/(am)'
}

local action = function(msg, matches)
local lang = client:get('UserLnag'..msg.from.id)

if not lang then return false end

	if msg.cb then
        local text = client:get('Text'..msg.from.id)
		if not text then return false end		
		if lang == 'FA' then
        if matches[1] == 'fa' or matches[1] == 'zh' or matches[1] == 'en' or matches[1] == 'ar' or matches[1] == 'ru' or matches[1] == 'fr' or matches[1] == 'ja' or matches[1] == 'de' or matches[1] == 'es' or matches[1] == 'tr' or matches[1] == 'it' or matches[1] == 'ro' or matches[1] == 'az' or matches[1] == 'am' then
			print(matches[1])
			local req = HTTPS.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..matches[1]..'&text='..text)
			local data = json:decode(req)
			api.sendMessage(msg.chat.id, 'ترجمه :\n*'..data.text[1]..'*', true)
        end
		if matches[1] == 'exit' then
			api.editMessageText(msg.chat.id, msg.message_id, 'شما از منوی ترجمه خارج شدید !')
        end
		elseif lang == 'EN' then
		if matches[1] == 'fa' or matches[1] == 'zh' or matches[1] == 'en' or matches[1] == 'ar' or matches[1] == 'ru' or matches[1] == 'fr' or matches[1] == 'ja' or matches[1] == 'de' or matches[1] == 'es' or matches[1] == 'tr' or matches[1] == 'it' or matches[1] == 'ro' or matches[1] == 'az' or matches[1] == 'am' then
			print(matches[1])
			local req = HTTPS.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..matches[1]..'&text='..text)
			local data = json:decode(req)
			api.sendMessage(msg.chat.id, 'Translate :\n*'..data.text[1]..'*', true)
        end
		if matches[1] == 'exit' then
			api.editMessageText(msg.chat.id, msg.message_id, 'Keyboard Removed!')
		end
		elseif lang == 'AR' then
		if matches[1] == 'fa' or matches[1] == 'zh' or matches[1] == 'en' or matches[1] == 'ar' or matches[1] == 'ru' or matches[1] == 'fr' or matches[1] == 'ja' or matches[1] == 'de' or matches[1] == 'es' or matches[1] == 'tr' or matches[1] == 'it' or matches[1] == 'ro' or matches[1] == 'az' or matches[1] == 'am' then
			print(matches[1])
			local req = HTTPS.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang='..matches[1]..'&text='..text)
			local data = json:decode(req)
			api.sendMessage(msg.chat.id, 'ترجمه :\n*'..data.text[1]..'*', true)
        end
		if matches[1] == 'exit' then
			api.editMessageText(msg.chat.id, msg.message_id, 'لوحات المفاتيح إزالتها!')
       end
  	end
   end
 end
	
return {
  action = action,
  triggers = triggers,
}