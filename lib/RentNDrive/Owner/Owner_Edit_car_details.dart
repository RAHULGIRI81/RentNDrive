import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Owner_edit_car_details extends StatefulWidget {
  final String carId;

  Owner_edit_car_details({required this.carId});

  @override
  _Owner_edit_car_detailsState createState() => _Owner_edit_car_detailsState();
}

class _Owner_edit_car_detailsState extends State<Owner_edit_car_details> {
  final _formKey = GlobalKey<FormState>();
  late DocumentSnapshot carData;
  bool _isLoading = true;

  late TextEditingController _ownerNameController;
  late TextEditingController _ownerPhoneController;
  late TextEditingController _makeController;
  late TextEditingController _modelController;
  late TextEditingController _yearController;
  late TextEditingController _gearBoxController;
  late TextEditingController _fuelController;
  late TextEditingController _distanceController;
  late TextEditingController _seatsController;
  late TextEditingController _rentController;

  @override
  void initState() {
    super.initState();
    _fetchCarDetails();
  }

  Future<void> _fetchCarDetails() async {
    carData = await FirebaseFirestore.instance
        .collection('carDetails')
        .doc(widget.carId)
        .get();

    setState(() {
      _ownerNameController = TextEditingController(text: carData['OwnerName']);
      _ownerPhoneController = TextEditingController(text: carData['OwnerPhone']);
      _makeController = TextEditingController(text: carData['make']);
      _modelController = TextEditingController(text: carData['model']);
      _yearController = TextEditingController(text: carData['year'].toString());
      _gearBoxController = TextEditingController(text: carData['GearBox']);
      _fuelController = TextEditingController(text: carData['Fuel']);
      _distanceController = TextEditingController(text: carData['distance']);
      _seatsController = TextEditingController(text: carData['seats']);
      _rentController = TextEditingController(text: carData['rent']);
      _isLoading = false;
    });
  }

  Future<void> _updateCarDetails() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance
          .collection('carDetails')
          .doc(widget.carId)
          .update({
        'OwnerName': _ownerNameController.text,
        'OwnerPhone': _ownerPhoneController.text,
        'make': _makeController.text,
        'model': _modelController.text,
        'year': int.parse(_yearController.text),
        'GearBox': _gearBoxController.text,
        'Fuel': _fuelController.text,
        'distance': _distanceController.text,
        'seats': _seatsController.text,
        'rent': _rentController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Car details updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car Details'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: 'Owner Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the owner name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ownerPhoneController,
                decoration: InputDecoration(labelText: 'Owner Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the owner phone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _makeController,
                decoration: InputDecoration(labelText: 'Vehicle Make'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vehicle make';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Vehicle Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vehicle model';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Year of Manufacture'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the year of manufacture';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gearBoxController,
                decoration: InputDecoration(labelText: 'Gear Box'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the gear box type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fuelController,
                decoration: InputDecoration(labelText: 'Fuel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the fuel type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _distanceController,
                decoration: InputDecoration(labelText: 'Total Distance'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the total distance';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _seatsController,
                decoration: InputDecoration(labelText: 'Seats'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of seats';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rentController,
                decoration: InputDecoration(labelText: 'Rent'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rent amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateCarDetails,
                child: Text('Update Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
