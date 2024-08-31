// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:equatable/equatable.dart';

class DropDownModel extends Equatable with CustomDropdownListFilter {
  final String label;
  final dynamic value;
  final bool disabled;
  final List<String> showFields;
  const DropDownModel(
    this.label,
    this.value, {
    this.disabled = false,
    this.showFields = const [],
  });

  @override
  String toString() {
    return label;
  }

  @override
  bool filter(String query) {
    return label.toLowerCase().contains(query.toLowerCase());
  }

  @override
  List<Object> get props => [label, value, disabled, showFields];
}
