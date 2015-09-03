macro "Looping Statements"{
	
	//Looping statements are used to repeatadly run a block of code. The ImageJ macro language has three looping statements:
	
	//1) for - runs a block of code a specified number of times
	print("This is an example of a for loop");
	for (i=0;i<10;i++){
		print(i);
	}
 
	//2)while - repeatedly runs a block of code while a condition is true
	print("This is an example of a while loop");
	i=0;
	while (i<10){
		print(i);
		i++;
	}
	
	//3)do...while - runs a block of code once then repeats while a condition is true
	print("This is an example of a do while loop");
	i = 0;
   	do {
      print(i);
      i = i + 10;
   	}
   	while (i<=90);


}
