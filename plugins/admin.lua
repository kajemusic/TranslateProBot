local triggers = {
	'^/(reload)$',
	'^/(bc) (.*)$',
	'^/(stats)$',
	'^/(id)$',
}
	
local action = function(msg, matches)
	
if is_admin(msg) then
	 if matches[1] == 'reload' then
		bot_init(true)
		local out = '*Bot Reloaded!*'
		api.sendReply(msg, out, true)
	end
	
	if matches[1] == 'bc' then
		local users = client:smembers('BcUsernames')
		local text = ''
		if not users then
		text = 'No User Available!'
		end
		for i=1, #users do
		api.sendMessage(users[i], matches[2], true)
		print(colors('%{green bright}Sent For'), users[i])
		text = 'Message Sent For *All* Users!'
		end
		api.sendReply(msg, text, true)
	end


 if matches[1] == 'stats' then
		--local inlines = client:get('InlineNums') or '0'
		local msgs = client:get('MsgNums') or '0'
		local starts = client:get('StartNums') or '0'
		local blocked = client:get('BlockedUsersN') or '0'
		local members = client:smembers('BcUsernames')
		local mem = ''
		if members then
			for i=1, #members do
				mem = '*Members Count* : `'..i..'`\n'
			end
		end
		
		local text = '#Stats\n*Blocked Users* : `'..blocked..'`\n*Messages* : `'..msgs..'`\n*Starts* : `'..starts..'`\n'..mem
		local dbinfo = client:info()
		text = text..'\n\n#Clinet Info\n'
	    text = text..'1 - *Client Version* : `'..dbinfo.server.redis_version..'`\n'
	    text = text..'2 - *Uptime Days* : `'..dbinfo.server.uptime_in_days..'('..dbinfo.server.uptime_in_seconds..' seconds)`\n'
	    text = text..'3 - *Commands Processed* : `'..dbinfo.stats.total_commands_processed..'`\n'
		text = text..'5 - *Expired Keys* : `'..dbinfo.stats.expired_keys..'`\n'
		text = text..'6 - *Ops/sec* : `'..dbinfo.stats.instantaneous_ops_per_sec..'`\n'
		api.sendMessage(msg.chat.id, text, true)
	end

if matches[1] == 'id' then
if not msg.reply then return end
if msg.reply then
local id = msg.reply.from.id
if msg.reply.forward_from then
id = msg.reply.forward_from.id
elseif msg.reply.forward_from_chat then
id = msg.reply.forward_from_chat.id
end

api.sendMessage(msg.chat.id, id, true)
end
end
end

end
	
return {
	action = action,
	triggers = triggers,
}
