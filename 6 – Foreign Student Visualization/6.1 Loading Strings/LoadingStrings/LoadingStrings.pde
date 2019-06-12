String file_data[];
int file_size;

void setup()
{
 size(400, 300);
 file_data = loadStrings("example.txt");
 if (file_data == null)
 {
     println("fill_date is null");
 }
 else
 {
    file_size = file_data.length;
    println("file_size: "+file_size);
 }
}