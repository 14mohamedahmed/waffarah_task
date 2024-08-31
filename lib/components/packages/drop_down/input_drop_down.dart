import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:waffaraha_task/components/packages/drop_down/drop_down_model.dart';
import 'package:waffaraha_task/core/utils/app_colors.dart';

const List<DropDownModel> _list = [];

class InputDropDown extends StatelessWidget {
  const InputDropDown(
      {this.multipleSelection = false,
      this.isRequired = false,
      required this.hint,
      this.validator,
      this.onChange,
      this.intialItems,
      this.items = const [],
      super.key});
  final String? Function(Map<String, dynamic>?)? validator;
  final String hint;
  final bool multipleSelection, isRequired;
  final Function(List<DropDownModel>)? onChange;
  final List<DropDownModel>? intialItems;
  final List<DropDownModel> items;
  @override
  Widget build(BuildContext context) {
    return multipleSelection
        ? CustomDropdown<DropDownModel>.multiSelectSearch(
            key: UniqueKey(),
            hintText: hint,
            items: items.isNotEmpty ? items : _list,
            initialItems: intialItems,
            onListChanged: onChange,
            validateOnChange: isRequired,
            listItemPadding: EdgeInsets.zero,
            listItemBuilder: (BuildContext context, DropDownModel item,
                bool isSelected, Function onItemSelect) {
              return _DropDownItem(
                  context, item, isSelected, onItemSelect, multipleSelection);
            },
            listValidator: (values) {
              if (!isRequired) return null;
              if (values.isEmpty) {
                return "$hint required";
              }
              return null;
            },
            decoration: inputStyle(),
            closedHeaderPadding: const EdgeInsets.fromLTRB(8, 13, 10, 13),
            canCloseOutsideBounds: true,
          )
        : CustomDropdown<DropDownModel>(
            hintText: hint,
            items: items.isNotEmpty ? items : _list,
            validateOnChange: isRequired,
            listItemPadding: EdgeInsets.zero,
            listItemBuilder: (context, item, isSelected, onItemSelect) {
              return _DropDownItem(
                context,
                item,
                isSelected,
                onItemSelect,
                multipleSelection,
              );
            },
            validator: (value) {
              if (!isRequired) return null;
              if (value == null) {
                return "Select At least one";
              }
              return null;
            },
            initialItem: intialItems?.first,
            onChanged: (value) {
              if (value!.disabled) return;
              if (onChange != null) onChange!([value]);
            },
            closedHeaderPadding: const EdgeInsets.fromLTRB(8, 13, 10, 13),
            decoration: inputStyle(),
            canCloseOutsideBounds: true,
          );
  }

  CustomDropdownDecoration inputStyle() {
    return CustomDropdownDecoration(
      closedFillColor: Colors.white,
      expandedFillColor: Colors.white,
      closedBorderRadius: BorderRadius.circular(4),
      expandedBorderRadius: BorderRadius.circular(4),
      closedBorder: Border.all(color: AppColors.grey2, width: 1.8),
      expandedBorder: Border.all(color: AppColors.grey2, width: 1.8),
    );
  }
}

class _DropDownItem extends StatelessWidget {
  const _DropDownItem(
    this.context,
    this.item,
    this.isSelected,
    this.onItemSelect,
    this.multipleSelection,
  );

  final BuildContext context;
  final DropDownModel item;
  final bool isSelected, multipleSelection;
  final Function onItemSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.disabled) return;
        onItemSelect();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              item.label,
              style: TextStyle(
                color: !item.disabled ? Colors.black : Colors.grey,
              ),
            ),
            if (multipleSelection && !item.disabled) const Spacer(),
            if (multipleSelection && !item.disabled)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: Checkbox(
                  onChanged: (_) {
                    if (item.disabled) return;
                    onItemSelect();
                  },
                  value: isSelected,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
