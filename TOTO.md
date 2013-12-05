

##Upload

####Batch Upload

Users can upload multiple files at once. Using jQuery file upload interface with drag and drop.
For each file, a Drawing record is created using the filename as the name of the drawing. The if the filename contains revision number, it will gets stripped and used as a value in the revision column.

For example.

	filename = 1206_AAA_F.A.1005_A.PDF
	new_drawing = Drawing.create({:name => "1206_AAA_F.A.1005" :revision => "A"})

Depending on the naming system, the filename may contain other information like project.name `1206_AAA` and drawing.name `F.A.1005`.

####Excel file

Each project has a `Drawing Register` which defines the properties of all drawings. This file is most likely be a excel `xls` file.

Users can upload an excel file containing ONE table on the FIRST sheet. The app will parse the table and create a Drawing record for each row. There will to be a check box in the form to indicate whether the excel file contains a table of Drawings or Parts drawing. It can not be both.



##References