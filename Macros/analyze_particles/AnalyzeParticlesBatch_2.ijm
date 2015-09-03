macro "AnalyzeParticlesBatch_2" {
	
	//1)Selecting directory of images
	
	dir = getDirectory("Choose a Directory with images");
	save_path = File.getParent(dir);
	

	//2)Generate directories to save channels, masks
	
	File.makeDirectory(save_path+"//"+"Red") ;
	File.makeDirectory(save_path+"//"+"Green"); 
	File.makeDirectory(save_path+"//"+"ROIs") ;
	
	//Get list of files in dir
	list = getFileList(dir);
	
	/*
	 * Loop
	 */
	 
    for (i=0; i<list.length; i++) {
    	
    	if (endsWith(list[i], ".tif")){
	    
	    //3)Open RGB image
	
		open(dir+list[i]);
		
		//4)Get RGB image name
		
		image = list[i];
		print(image);
		len = lengthOf(image);
		image_name = substring(image, 0, len-4); //substring 
		print(image_name);
		
		//5)Split RGB into red, green, and blue channels
		
		run("Split Channels");
	
		//6) Select red channel and save the image in directory
		
		selectImage(image + " (red)");
		save(save_path+"//"+"Red"+"//"+ image_name + "_red.tif");
	
		//7) Run threhsold, make binary, run AnalyzeParticles command
	
		setAutoThreshold("Otsu dark");
		run("Convert to Mask");
		run("Analyze Particles...", "display clear add");
	
		//8) Save results
		
		saveAs("Results",save_path+"//"+"ROIs"+"//"+image_name+"_red"+".csv");
		
		//9) Save ROIs
		
		roiManager("Save",save_path+"//"+"ROIs"+"//"+image_name+"_red"+".zip");
		roiManager("reset");
	
		/*
		 * For green image repeat steps 6 to 9 but replacing red with green
		 */
	
		//6) Select green channel and save the image in directory
		
		selectImage(image + " (green)");
		save(save_path+"//"+"Green"+"//"+ image_name + "_green.tif");
	
		//7) Run threhsold, make binary, run AnalyzeParticles command
	
		setAutoThreshold("Otsu dark");
		run("Convert to Mask");
		run("Analyze Particles...", "display clear add");
	
		//8) Save results
		
		saveAs("Results",save_path+"//"+"ROIs"+"//"+image_name+"_green"+".csv");
		
		//9) Save ROIs
		
		roiManager("Save",save_path+"//"+"ROIs"+"//"+image_name+"_green"+".zip");
		roiManager("reset");
	   	
	   	//10)Close all images
	   	run("Close All");
	   	
		 }
	 }
	
	
}
