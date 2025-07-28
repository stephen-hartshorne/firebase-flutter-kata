import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PatientInfoForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onFormSubmit;

  const PatientInfoForm({required this.onFormSubmit, super.key});

  @override
  State<StatefulWidget> createState() {
    return PatientInfoFormState();
  }
}

class PatientInfoFormState extends State<PatientInfoForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();

  final _emergencyContactName = TextEditingController();
  final _emergencyContactPhone = TextEditingController();

  String? _gender;

  void _onFormSubmit() {
    final data = {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'dateOfBirth': _dateOfBirthController.text,
      'gender': _gender,
      'phoneNumber': _phoneNumberController.text,
      'email': _emailController.text,
      'emergencyContactName': _emergencyContactName.text,
      'emergencyContactPhoneNumber': _emergencyContactPhone.text,
    };
    widget.onFormSubmit(data);
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date of Birth is required';
    }

    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Please provide your basic information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          _spacer(),

          _buildHeader(title: 'Personal Information'),
          _spacer(),
          _buildTextFormField(
            label: 'First Name',
            controller: _firstNameController,
            validator: _validateName,
          ),
          _spacer(),
          _buildTextFormField(
            label: 'Last Name',
            controller: _lastNameController,
            validator: _validateName,
          ),
          _spacer(),
          _buildDateOfBirthFormField(),
          _spacer(),
          _buildGenderFormField(),
          _spacer(),
          _buildHeader(title: 'Contact Information'),
          _spacer(),
          _buildTextFormField(
            controller: _phoneNumberController,
            validator: _validatePhoneNumber,
            label: 'Phone Number',
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              _PhoneNumberFormatter(),
            ],
          ),
          _spacer(),
          _buildTextFormField(
            controller: _emailController,
            label: 'Email (Optional)',
            validator: _validateEmail,
          ),
          _spacer(),
          _buildHeader(title: 'Emergency Contact Information'),
          _spacer(),
          _buildTextFormField(
            controller: _emergencyContactName,
            label: 'Emergency Contact Name',
            validator: _validateName,
          ),
          _spacer(),
          _buildTextFormField(
            controller: _emergencyContactPhone,
            validator: _validatePhoneNumber,
            label: 'Emergency Contact Phone Number',
            formatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              _PhoneNumberFormatter(),
            ],
          ),
          _spacer(),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => {
                if (_formKey.currentState!.validate()) {_onFormSubmit()},
              },
              child: const Text(
                'Save Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _spacer() {
    return const SizedBox(height: 32);
  }

  Widget _buildHeader({required title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    GestureTapCallback? onTap,
    bool readOnly = false,
    List<TextInputFormatter>? formatters,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blueGrey, width: 2),
        ),
      ),
      controller: controller,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      inputFormatters: formatters,
    );
  }

  Widget _buildDateOfBirthFormField() {
    return _buildTextFormField(
      label: 'Date of Birth',
      controller: _dateOfBirthController,
      validator: _validateDateOfBirth,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          _dateOfBirthController.text = DateFormat(
            'yyyy/MM/dd',
          ).format(pickedDate);
        }
      },
    );
  }

  Widget _buildGenderFormField() {
    return FormField<String>(
      validator: (value) {
        if (_gender == null) {
          return 'Gender must be selected.';
        }
        return null;
      },
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Gender *'),
            RadioListTile<String>(
              title: const Text(
                'Male',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              value: 'male',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Female'),
              value: 'female',
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Other'),
              value: 'other',
              groupValue: _gender,
              onChanged: (value) {
                setState(() => _gender = value);
              },
              activeColor: Colors.blueGrey,
            ),
            if (state.hasError)
              Text(state.errorText!, style: const TextStyle(color: Colors.red)),
          ],
        );
      },
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.length <= 3) {
      return newValue;
    } else if (text.length <= 6) {
      return TextEditingValue(
        text: '${text.substring(0, 3)}-${text.substring(3)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else {
      return TextEditingValue(
        text:
            '${text.substring(0, 3)}-${text.substring(3, 6)}-${text.substring(6)}',
        selection: TextSelection.collapsed(offset: text.length + 2),
      );
    }
  }
}
