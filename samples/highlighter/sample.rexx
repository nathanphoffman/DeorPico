/* REXX sample -- block comments only */
parse arg name count
if name = '' then name = "world"
if count = "" then count = 3

total = 0
do i = 1 to count
  say 'Hello,' name || "!" i
  total = total + square(i) * 1.5
end

select
  when total > 100 then say "big"
  otherwise say 'small:' total
end
call finish
exit 0

square: procedure
  arg n
  return n * n

finish:
  say "It''s done"
  return
