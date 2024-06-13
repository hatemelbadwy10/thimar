// FloatingActionButton(
// onPressed: () {
// showModalBottomSheet(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadiusDirectional.only(
// topStart: Radius.circular(
// 38.r,
// ),
// topEnd: Radius.circular(
// 38.r,
// ),
// ),
// ),
// context: context,
// builder: (context) => BlocBuilder(
// bloc: addressBloc
// ..add(
// GetUserAddressEvent(),
// ),
// builder: (context, state) {
// if (state is GetUserAddressLoadingState) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (state
// is GetUserAddressSuccessState) {
// return Column(
// children: [
// SizedBox(
// height: 20.h,
// ),
// Center(
// child: Text(
// "العناوين",
// style: TextStyle(
// fontSize: 15.sp,
// fontWeight: FontWeight.bold,
// color:
// Theme.of(context).primaryColor,
// ),
// ),
// ),
// Expanded(
// child: AddressesListView(onSubmit: (x) {
// _event.addressModel = x;
// Navigator.of(context).pop();
// setState(() {});
// }),
// ),
// SizedBox(
// height: 20.h,
// ),
// ],
// );
// } else {
// return const SizedBox.shrink();
// }
// },
// ),
// );
// },
// mini: true,
// backgroundColor: const Color(0xff4C8613).withOpacity(
// 0.13,
// ),
// elevation: 0.0,
// shape: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 9.r,
// ),
// borderSide: BorderSide(
// color: const Color(
// 0xffFFFFFF,
// ).withOpacity(0.14),
// ),
// ),
// child: Icon(
// _event.addressModel == null ? Icons.add : Icons.edit,
// color: Theme.of(context).primaryColor,
// size: 22.r,
// ),
// )

///////////////////////////////////////////////////////////////////


///////////////////////////////////////
// Expanded(
// child: TextFormField(
// readOnly: true,
// controller: _dateController, // TextEditingController
// onTap: () async {
// final DateTime? picked = await showDatePicker(
// context: context,
// initialDate: _selectedDate ?? DateTime.now(),
// firstDate: DateTime(1900),
// lastDate: DateTime(2101),
// );
// if (picked != null && picked != _selectedDate) {
// setState(() {
// _selectedDate = picked;
// _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
// });
// }
// },
// decoration: InputDecoration(
// labelText: 'Select Date',
// suffixIcon: IconButton(
// icon: Icon(Icons.calendar_today),
// onPressed: () async {
//
// final DateTime? picked = await showDatePicker(
// context: context,
// initialDate: _selectedDate ?? DateTime.now(),
// firstDate: DateTime(1900),
// lastDate: DateTime(2101),
// );
// if (picked != null && picked != _selectedDate) {
// setState(() {
//
// _selectedDate = picked;
// _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
// _event.date= DateFormat('yyyy-MM-dd').format(_selectedDate!);
// });
// }
//
// },
// ),
// ),
// ),
// ),