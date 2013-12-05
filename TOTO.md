

##Upload

####Batch Upload

Users can upload multiple files at once. Using jQuery file upload interface with drag and drop.
For each file, a Drawing record is created using the filename as the name of the drawing. The if the filename contains revision number, it will gets stripped and used as a value in the revision column.

For example.

	filename = 1206_AAA_F.A.1005_A.PDF
	new_drawing = Drawing.create({:name => "1206_AAA_F.A.1005" :revision => "A"})

Depending on the naming system, the filename may contain other information like project.number `1206` and drawing.name `F.A.1005`.





##References