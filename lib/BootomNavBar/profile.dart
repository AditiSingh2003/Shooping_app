import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  foregroundImage: AssetImage('assets/images/my_photo.png',
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Center(
                child: Text('adithakurti@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: const Color(0xFFF08080),
                  minimumSize: Size(MediaQuery.of(context).size.width/2, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Edit Profiler',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => Insert()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.settings,
                        color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        Text('Settings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    )
                  ],
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => FetchData()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wallet_sharp,
                        color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        Text('Billing Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    )
                  ],
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 60,
                child: ElevatedButton(onPressed: (){},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle_rounded,
                        color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        Text('User Management',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    )
                  ],
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                color: Colors.white,
                height: 60,
                child: ElevatedButton(onPressed: (){},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info,
                        color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        Text('Information',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    )
                  ],
                ),
                ),
              ),
              const SizedBox(height: 20,),
              
              Container(
                color: Colors.white,
                height: 60,
                child: ElevatedButton(onPressed: (){
                  SystemNavigator.pop();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.logout,
                        color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        Text('Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    )
                  ],
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//list

  Widget ButtonList ({
    required BuildContext context,
    required IconData icon,
    required Color col,
    required String text,
    required IconData back,
  }) {
    return
      ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.white,
          minimumSize: Size(MediaQuery.of(context).size.width, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10,),
              Text(text,
              style: TextStyle(
              fontSize: 18,
              color: col,
            ),
          ),
            ],
          ),
        Icon(back)
          ],
        ),
        );
  }
