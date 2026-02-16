import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  // Variable to manage the current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // String to show current Theme 
  String _themeText = 'Light Mode';

  // Method to toggle the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Demo',
       
      // TODO: Customize these themes further if desired
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200], // Light mode background
	primaryColor: Colors.grey,
      ),
      // Dark mode configuration
      darkTheme: ThemeData(
	 primarySwatch: Colors.purple,
	 scaffoldBackgroundColor: Colors.black,
	 primaryColor: Colors.purple,

      ), 
      
      themeMode: _themeMode, // Connects the state to the app
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PART 1 TASK: Container and Text
              AnimatedContainer(
                width: 300,
                height: 190,
                margin: const EdgeInsets.all(20),

		duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  // Use a ternary operator to check theme brightness
                  color: _themeMode== ThemeMode.dark 
                      ? Colors.white 
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
		padding: const EdgeInsets.all(12), 
	        child: Column(        
		   children: [
		      Icon(
			Icons.phone_android,
			color: Colors.black,
			size: 70.0,
		      ), 
		      const Text(
			'Mobile App Development Testing',
			style: TextStyle(fontSize: 18, color: Colors.black),
			textAlign: TextAlign.center,
		      ),

		      const Text(
			'Showcasing theme switching with smooth animations', 
			style: TextStyle(fontSize: 16, color: Colors.black),
			textAlign: TextAlign.center,
		      ),
		 ],  
		),
              ),
              
              //const SizedBox(height: 20),
              
                            
              //const SizedBox(height: 10),

              // PART 1 TASK: Controls
	      // Task 1: AnimatedContainer 
	      AnimatedContainer(
	       width: 300,
	       height: 150,
	       margin: const EdgeInsets.all(20),

	       // Task 3: Custom Animation Duration
	       duration: const Duration(milliseconds: 500),      
	       decoration: BoxDecoration(
	    	  color: _themeMode==ThemeMode.dark ? Colors.white : Colors.grey, 
		  borderRadius: BorderRadius.circular(20),
	       ),
	       padding: const EdgeInsets.all(20),
	       child: Column(
	          children: [
	             const Text('Choose Theme:', style: TextStyle(fontSize: 18, color: Colors.black)),
		     // Switch between themes 
		     Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
			   
			   //Task 4: Dynamic Light mode Icon 
			   Icon(
			      Icons.wb_sunny,
			      color: _themeMode== ThemeMode.dark ? Colors.grey : Colors.yellow,),  
			   // Task 2: Switch Widget
			   Switch(
			      value: _themeMode== ThemeMode.dark,
			      onChanged: (isDark) {
				 //Switch fucntion for changing themes  
				 setState(() {
				    _themeMode= isDark ? ThemeMode.dark : ThemeMode.light;

				    //Updates string value to show current Theme 
				    _themeText= _themeMode==ThemeMode.dark  ? 'Dark Mode' : 'Light Mode';
				    
				 });
			      },

			   ),
			   
			   // Task 4: Dynamic Dark mode Icon
			   Icon(
			      Icons.nightlight_round,
			      color: _themeMode==ThemeMode.dark ? Colors.yellow : Colors.grey[200],
			   ),
			],
		     ),
		     Text(_themeText, style: TextStyle(fontSize: 14, color: Colors.black)),
		 ],
	       ),
	      ),

            ],
          ),
        ),
      ),
    );
  }
}
      
