import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/widgets/services_and_restaurnts_items.dart';
import 'package:e_commerce_app/models/service_model.dart';
import 'package:flutter/material.dart';

class CustomeServices extends StatelessWidget {
  final List<ServiceModel> services;

  const CustomeServices({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomeText(
            text: 'Services',
            fontSize: 18,
            font: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 130,
          child: services.isEmpty
              ? Center(
                  child: CustomeText(
                    text: 'No services available',
                    textColor: Colors.grey,
                    fontSize: 14,
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Row(
                    children: List.generate(services.length, (index) {
                      final service = services[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < services.length - 1 ? 20 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Handle service tap
                          },
                          child: ServicesndResturntsItems(
                            image: _getServiceImage(service.name),
                            text: service.name,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
        ),
      ],
    );
  }

  String _getServiceImage(String serviceName) {
    switch (serviceName.toLowerCase()) {
      case 'food':
        return 'assets/images/Group 76.png';
      case 'health':
        return 'assets/images/vector-a-set-of-medicine-and-prescription-removebg-preview-2048x1773 1.png';
      case 'groceries':
        return 'assets/images/Group 78.png';
      default:
        return 'assets/images/Group 76.png';
    }
  }
}
