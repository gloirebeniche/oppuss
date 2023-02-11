import 'package:flutter/material.dart';
import 'package:oppuss/models/service_home_page.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class HomePageParticular extends StatefulWidget {
  const HomePageParticular({super.key});
  @override
  State<HomePageParticular> createState() => _HomePageParticularState();
}

class _HomePageParticularState extends State<HomePageParticular> {
  final List<Map> myList =
      List.generate(100000, (index) => {"id": index, "name": "Card $index"})
          .toList();
  List<ServiceHomePage> services = [
    ServiceHomePage('Cleaning',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    ServiceHomePage('Plumber',
        'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png'),
    ServiceHomePage('Electrician',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png'),
    ServiceHomePage('Painter',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-painter-male-occupation-avatar-itim2101-flat-itim2101.png'),
    ServiceHomePage('Carpenter', 'https://img.icons8.com/fluency/2x/drill.png'),
    ServiceHomePage('Gardener',
        'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png'),
    ServiceHomePage(
        'Tailor', 'https://img.icons8.com/fluency/2x/sewing-machine.png'),
    ServiceHomePage(
        'Maid', 'https://img.icons8.com/color/2x/housekeeper-female.png'),
    ServiceHomePage('Driver',
        'https://img.icons8.com/external-sbts2018-lineal-color-sbts2018/2x/external-driver-women-profession-sbts2018-lineal-color-sbts2018.png'),
    ServiceHomePage('Cook',
        'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-cooking-daily-routine-wanicon-flat-wanicon.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Acceuil", context),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 25.0,
                  mainAxisSpacing: 25.0,
                ),
                itemCount: services.length,
                itemBuilder: (BuildContext context, int index) {
                  return serviceContainer(
                      services[index].imageURL, services[index].name, index);
                }),
              
        ))
        );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {

        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}
