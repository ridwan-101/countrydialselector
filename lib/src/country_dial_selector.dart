import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'country_data.dart';

class CountryPickerWheel extends StatefulWidget {
  final List<CountryData> countries;
  final CountryData? initialCountry;
  final ValueChanged<CountryData> onSelected;

  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color borderColor;

  final double height;
  final double itemExtent;

  const CountryPickerWheel({
    super.key,
    required this.onSelected,
    this.countries = defaultCountries,
    this.initialCountry,
    this.selectedTextColor = Colors.blue,
    this.unselectedTextColor = Colors.grey,
    this.borderColor = Colors.blue,
    this.height = 220,
    this.itemExtent = 55,
  });

  @override
  State<CountryPickerWheel> createState() => _CountryPickerWheelState();
}

class _CountryPickerWheelState extends State<CountryPickerWheel> {
  late FixedExtentScrollController _controller;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.initialCountry == null
        ? 0
        : widget.countries.indexWhere(
            (c) => c.dialCode == widget.initialCountry!.dialCode,
          );

    if (selectedIndex < 0) selectedIndex = 0;

    _controller = FixedExtentScrollController(initialItem: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: widget.height.h,
          child: ListWheelScrollView.useDelegate(
            controller: _controller,
            physics: const FixedExtentScrollPhysics(),
            itemExtent: widget.itemExtent.h,
            perspective: 0.003,
            diameterRatio: 1.4,
            onSelectedItemChanged: (index) {
              setState(() => selectedIndex = index);
              widget.onSelected(widget.countries[index]);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.countries.length,
              builder: (context, index) {
                final country = widget.countries[index];
                final isSelected = index == selectedIndex;

                return Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: isSelected
                          ? widget.selectedTextColor
                          : widget.unselectedTextColor,
                      fontSize: isSelected ? 18.sp : 15.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                    child: Text('${country.name} (${country.dialCode})'),
                  ),
                );
              },
            ),
          ),
        ),

        IgnorePointer(
          child: Container(
            height: widget.itemExtent.h,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: widget.borderColor),
            ),
          ),
        ),
      ],
    );
  }
}
