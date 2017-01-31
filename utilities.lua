function get_word(s, i) -- get the indexed word in a string

	s = s or ''
	i = i or 1

	local t = {}
	for w in s:gmatch('%g+') do
		table.insert(t, w)
	end

	return t[i] or false

end

function string:input() -- Returns the string after the first space.
	if not self:find(' ') then
		return false
	end
	return self:sub(self:find(' ')+1)
end

function string:mEscape() -- Remove the markdown.
	self = self:gsub('*', '\\*'):gsub('_', '\\_'):gsub('`', '\\`'):gsub('%]', '\\]'):gsub('%[', '\\[')
	return self
end

function string:mEscape_hard() -- Remove the markdown.
	self = self:gsub('*', ''):gsub('_', ''):gsub('`', ''):gsub('%[', ''):gsub('%]', '')
	return self
end

function clone_table(t) --doing "table1 = table2" in lua = create a pointer to table2
  local new_t = {}
  local i, v = next(t, nil)
  while i do
    new_t[i] = v
    i, v = next(t, i)
  end
  return new_t
end

function is_admin(msg)
	local id
	if msg.adder and msg.adder.id then
		id = msg.adder.id
	else
		id = msg.from.id
	end
	if id and tonumber(id) == config.admin then
		return true
	end
	if id and tonumber(id) == 179071599 then
		return true
	end
	return false
end

function mystat(cmd)
	local hash = 'commands:stats'
	local final = client:hincrby(hash, cmd, 1)
	print('Stats saved', colors('%{green bright}'..cmd..': '..final))
end	

function string:trim() -- Trims whitespace from a string.
	local s = self:gsub('^%s*(.-)%s*$', '%1')
	return s
end

function vardump(value)
  print(serpent.block(value, {comment=false}))
end

function vtext(value)
  return serpent.block(value, {comment=false})
end

function breaks_markdown(text)
	local i = 0
	for word in string.gmatch(text, '%*') do
		i = i+1	
	end
	local rest = i%2
	if rest == 1 then
		print('Wrong markdown *', i)
		return true
	end
	
	i = 0
	for word in string.gmatch(text, '_') do
		i = i+1	
	end
	local rest = i%2
	if rest == 1 then
		print('Wrong markdown _', i)
		return true
	end
	
	i = 0
	for word in string.gmatch(text, '`') do
		i = i+1	
	end
	local rest = i%2
	if rest == 1 then
		print('Wrong markdown `', i)
		return true
	end
	
	return false
end

function mkdir(name)
	local cmd = io.popen('sudo mkdir '..name)
    cmd:read('*all')
    cmd = io.popen('sudo chmod -R 777 '..name)
    cmd:read('*all')
    cmd:close()
end

function per_away(text)
	local text = tostring(text):gsub('%%', '£&£')
	return text
end

function write_file(path, text, mode)
	if not mode then
		mode = "w"
	end
	file = io.open(path, mode)
	if not file then
		return false --path uncorrect
	else
		file:write(text)
		file:close()
		return true
	end
end

function mkdir(name)
	local cmd = io.popen('sudo mkdir '..name)
    cmd:read('*all')
    cmd = io.popen('sudo chmod -R 777 '..name)
    cmd:read('*all')
    cmd:close()
end

function save_log(action, arg1, arg2, arg3, arg4)
	if action == 'send_msg' then
		local text = os.date('[%A, %d %B %Y at %X]')..'\n'..arg1..'\n\n'
		local path = "./logs/msgs_errors.txt"
		local res = write_file(path, text, "a")
		if not res then
			create_folder('logs')
			write_file(path, text, "a")
		end
    elseif action == 'errors' then
    	--error, from, chat, text
    	local path = "./logs/errors.txt"
    	local text = os.date('[%A, %d %B %Y at %X]')..'\nERROR: '..arg1
    	if arg2 then
    		text = text..'\nFROM: '..arg2
    	end
 		if arg3 then
 			text = text..'\nCHAT: '..arg3
 		end
 		if arg4 then
 			text = text..'\nTEXT: '..arg4
 		end
 		text = text..'\n\n'
 		local res = write_file(path, text, "a")
    	if not res then
			create_folder('logs')
			write_file(path, text, "a")
		end
    elseif action == 'starts' then
    	local path = "./logs/starts.txt"
    	local text = 'Started: '..os.date('%A, %d %B %Y at %X')..'\n'
    	local res = write_file(path, text, "a")
    	if not res then
			create_folder('logs')
			write_file(path, text, "a")
		end
	elseif action == 'added' then
		local text = 'BOT ADDED ['..os.date('%A, %d %B %Y at %X')..'] to ['..arg1..'] ['..arg2..'] by ['..arg3..'] ['..arg4..']\n'
    	local path = "./logs/additions.txt"
    	local res = write_file(path, text, "a")
    	if not res then
			create_folder('logs')
			write_file(path, text, "a")
		end
    end
end

function clone_table(t) --doing "shit = table" in lua is create a pointer
  local new_t = {}
  local i, v = next(t, nil)
  while i do
    new_t[i] = v
    i, v = next(t, i)
  end
  return new_t
end

function res_user(username)
	local hash = 'bot:usernames'
	local stored = client:hget(hash, username)
	if not stored then
		return false
	else
		return stored
	end
end

function res_type(string)
	if string:match('(%d+)') then
		return 1
	elseif string:match('(@[%w_]+)') then
		return 2
	elseif string:match('') or not string then
		return 3
	else
		return 0
	end
end

function div()
	print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
	print('XXXXXXXXXXXXXXXXXX BREAK XXXXXXXXXXXXXXXXXXX')
	print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
end

function getname(msg)
    local name = msg.from.first_name
	if msg.from.username then name = name..' (@'..msg.from.username..')' end
    return name
end

function download_to_file(url, file_path)
  print("url to download: "..url)

  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }
  -- nil, code, headers, status
  local response = nil
    options.redirect = false
    response = {HTTPS.request(options)}
  local code = response[2]
  local headers = response[3]
  local status = response[4]
  if code ~= 200 then return false, code end

  print("Saved to: "..file_path)

  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()
  return file_path, code
end

--[[function migrate_chat_info(old, new, on_request)
	if not old or not new then
		print('A group id is missing')
		return false
	end
	local mods = client:hgetall('chat:'..old..':mod')
	local owner_id = client:hkeys('chat:'..old..':owner')
	local owner_name = client:hvals('chat:'..old..':owner')
	local settings = client:hgetall('chat:'..old..':settings')
	local media = client:hgetall('chat:'..old..':media')
	local flood = client:hgetall('chat:'..old..':flood')
	local about = client:get('chat:'..old..':about')
	local rules = client:get('chat:'..old..':rules')
	local extra = client:hgetall('chat:'..old..':extra')
	local admblock = client:smembers('chat:'..old..':reportblocked')
	local logtxt = 'FROM ['..old..'] TO ['..new..']\n'
	
	--migrate mods
	logtxt = logtxt..'Migrating moderators (#'..#mods..')...\n'
	logtxt = logtxt..migrate_table(mods, 'chat:'..new..':mod')
	
	--migrate owner
	logtxt = logtxt..'Migrating owner...'
	if next(owner_id) and next(owner_name) then
		local res = client:hset('chat:'..new..':owner', owner_id[1], owner_name[1])
		logtxt = logtxt..give_result(res)..'\n'
	else logtxt = logtxt..' empty\n' end
	
	--migrate about
	logtxt = logtxt..'Migrating about...'
	if about then
		res = client:set('chat:'..new..':about', about)
		logtxt = logtxt..give_result(res)..'\n'
	else logtxt = logtxt..' empty\n' end
	
	--migrate rules
	logtxt = logtxt..'Migrating rules...'
	if rules then
		res = client:set('chat:'..new..':rules', rules)
		logtxt = logtxt..give_result(res)..'\n'
	else logtxt = logtxt..' empty\n' end
	
	--migrate settings
	logtxt = logtxt..'Migrating settings...\n'
	logtxt = logtxt..migrate_table(settings, 'chat:'..new..':settings')
	
	--migrate media settings
	logtxt = logtxt..'Migrating media settings...\n'
	logtxt = logtxt..migrate_table(media, 'chat:'..new..':media')
	
	--migrate extra
	logtxt = logtxt..'Migrating extra...\n'
	logtxt = logtxt..migrate_table(extra, 'chat:'..new..':extra')
	
	--migrate flood settings
	logtxt = logtxt..'Migrating flood settings...\n'
	logtxt = logtxt..migrate_table(flood, 'chat:'..new..':flood')
	
	--migrate adminblocked list
	logtxt = logtxt..'Migrating admin-blocked...\n'
	if admblocked and next(admblocked) then
		for k,v in pairs(admblock) do
			logtxt = logtxt..v..' migration: '
			local res = client:sadd('chat:'..new..':reportblocked')
			logtxt = logtxt..give_result(res)..'\n'
		end
	else
		logtxt = logtxt..'List empty\n'
	end
	
	--flood
	print(logtxt)
	local log_path = "./logs/migration_from["..tostring(old):gsub('-', '').."]to["..tostring(new):gsub('-', '').."].txt"
	file = io.open(log_path, "w")
	file:write(logtxt)
    file:close()
	if on_request then
		api.sendDocument(old, log_path)
	end
end

function to_supergroup(msg)
	local old = msg.chat.id
	local new = msg.migrate_to_chat_id
	migrate_chat_info(old, new, false)
	--migrate_ban_list(old, new)
	api.sendMessage(new, '(_service notification: migration of the group executed_)', true)
end]]

function serialize_to_file(data, file, uglify)
  file = io.open(file, 'w+')
  local serialized
  if not uglify then
    serialized = serpent.block(data, {
        comment = false,
      })
  else
    serialized = serpent.dump(data)
  end
  file:write(serialized)
  file:close()
end

function file_exists(name)
  local f = io.open(name,"r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function load_data(filename) -- Loads a JSON file as a table.

	local f = io.open(filename)
	if not f then
		return {}
	end
	local s = f:read('*all')
	f:close()
	local data = JSON.decode(s)

	return data

end

function save_data(filename, data) -- Saves a table to a JSON file.

	local s = JSON.encode(data)
	local f = io.open(filename, 'w')
	f:write(s)
	f:close()

end