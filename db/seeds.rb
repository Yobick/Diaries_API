Diary.delete_all
Note.delete_all

count = 1
(1..2).each do |i|
  d = Diary.create({ title: 'Reader-v1.0',  expiration: DateTime.now + 2.day, kind: rand(0..1) })
  while count <= 3 do
    d.notes.create({text: 'Text'})
    count += 1
  end
  if count >= 6
    while count <= 9 do
      d.notes.create({text: 'Text'})
      count += 1
    end
  end

  if i >= 1
    d1 = Diary.create({ title: 'Reader-v2.0',  expiration: DateTime.now + 10.minute, kind: rand(0..1) })
    while count <= 6 do
      d1.notes.create({text: 'Text'})
      count += 1
    end
    if count >= 9
      while count <= 12 do
        d1.notes.create({text: 'Text'})
        count += 1
      end
    end
  end
end