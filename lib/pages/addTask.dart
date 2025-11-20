import 'package:flutter/material.dart';
import 'package:todolist/theme/helper.dart';
import 'package:todolist/Database/db_helper.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<addTask> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNodeJudul = FocusNode();

  bool _isCategoryExpanded = false;
  String? _selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _categories = ['Work', 'Personal', 'Shopping', 'Health'];

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Pilih Tanggal Batas Waktu',
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      helpText: 'Pilih Waktu Deadline',
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  Future<void> _saveTask() async {
    if (_globalKey.currentState!.validate()) {
      final String title = _judulController.text.trim();
      final String? category = _selectedCategory;
      final String? date = _selectedDate != null
          ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
          : null;
      final String? time = _selectedTime != null
          ? '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
          : null;
      final String? note = _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim();

      await DBHelper.instance.addTask(
        title: title,
        category: category,
        date: date,
        time: time,
        note: note,
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Task',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: AppColor().primer,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: AppColor().orange,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Form(
                  key: _globalKey,
                  child: TextFormField(
                    controller: _judulController,
                    focusNode: _focusNodeJudul,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Tambahkan Judul',
                      hintStyle: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.06),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColor().primer,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isCategoryExpanded = !_isCategoryExpanded;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedCategory ?? 'Pilih Kategori',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            Icon(
                              _isCategoryExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_right,
                              color: AppColor().primer,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 250),
                      firstChild: const SizedBox(),
                      secondChild: Column(
                        children: _categories.map((category) {
                          return ListTile(
                            title: Text(
                              category,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                                _isCategoryExpanded = false;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      crossFadeState: _isCategoryExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.07),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor().primer,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: AppColor().kuning,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: _pickDate,
                      child: Text(
                        _selectedDate == null
                            ? 'Tentukan batas waktu'
                            : 'Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.07,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: AppColor().orange,
                      size: 28,
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: _pickTime,
                      child: Text(
                        _selectedTime == null
                            ? 'Tentukan waktu'
                            : 'Waktu: ${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.07),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Note',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColor().primer,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextFormField(
                  controller: _noteController,
                  keyboardType: TextInputType.multiline,
                  minLines: 6,
                  maxLines: 12,
                  decoration: InputDecoration(
                    hintText: 'Tambahkan catatan di sini...',
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor().primer,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: screenWidth * 0.9,
                height: 55,
                child: ElevatedButton(
                  onPressed: _saveTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor().primer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
