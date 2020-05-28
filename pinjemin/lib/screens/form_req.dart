import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/section.dart';
import '../providers/products.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}

class FormReq extends StatefulWidget {
  static String tag = 'form-req-page';
  

  @override
  _FormReqState createState() => _FormReqState();
}

class _FormReqState extends State<FormReq> {
  final _priceFocusNode = FocusNode();
  // final _startDate = FocusNode();
  // final _endDate = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    name: '',
    price: 0,
    desc: '',
    image: '',
  );
   var _initValues = {
    'name': '',
    'desc': '',
    'price': '',
    'image': '',
  };
  var _isInit = true;
  var _isLoading = false;
  DateTime selectedStartDate = new DateTime.now();
  TimeOfDay selectedStartTime = new TimeOfDay.now();
  DateTime selectedEndDate = new DateTime.now();
  TimeOfDay selectedEndTime = new TimeOfDay.now();

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Color.fromARGB(255, 255, 119, 0),
            primarySwatch: Colors.orange));
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showRoundedTimePicker(
      context: context,
      initialTime: selectedStartTime,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Color.fromARGB(255, 255, 119, 0),
          primarySwatch: Colors.orange),
    );
    if (picked != null) {
      setState(() {
        selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime picked = await showRoundedDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 1),
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Color.fromARGB(255, 255, 119, 0),
            primarySwatch: Colors.orange));
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showRoundedTimePicker(
      context: context,
      initialTime: selectedEndTime,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Color.fromARGB(255, 255, 119, 0),
          primarySwatch: Colors.orange),
    );
    if (picked != null) {
      setState(() {
        selectedEndTime = picked;
      });
    }
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    // tglAmbilText = "${tglAmbil.day}/${tglAmbil.month}/${tglAmbil.year}";
    // tglKembaliText = "${tglKembali.day}/${tglKembali.month}/${tglKembali.year}";
    _imageUrlFocusNode.addListener(_updateImageUrl);
    _priceFocusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as int;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(id: productId, type: false);
        _initValues = {
          'name': _editedProduct.name,
          'desc': _editedProduct.desc,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          'image': '',
        };
        _imageUrlController.text = _editedProduct.image;
        selectedStartDate = _editedProduct.startDate;
        selectedStartTime = new TimeOfDay(hour: _editedProduct.startDate.hour, minute: _editedProduct.startDate.minute);
        selectedEndDate = _editedProduct.endDate;
        selectedEndTime = new TimeOfDay(hour: _editedProduct.endDate.hour, minute: _editedProduct.endDate.minute);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    var startDate = new DateTime(
        selectedStartDate.year,
        selectedStartDate.month,
        selectedStartDate.day,
        selectedStartTime.hour,
        selectedStartTime.minute,
        selectedStartDate.second);
    var endDate = new DateTime(
        selectedEndDate.year,
        selectedEndDate.month,
        selectedEndDate.day,
        selectedEndTime.hour,
        selectedEndTime.minute,
        selectedEndDate.second);
    var reqSection = Section(startDate: startDate, endDate: endDate, type: 0);
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct, reqSection);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct, reqSection);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
      // finally {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form Permintaan"),
        
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
            color: Colors.white,
            child: Padding(
              
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _form,
                  child: ListView(
                    children: <Widget>[
                      // TITLE FORM FIELD
                      TextFormField(
                        initialValue: _initValues['name'],
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        cursorColor: Colors.black12,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide a value.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              name: value,
                              price: _editedProduct.price,
                              desc: _editedProduct.desc,
                              image: _editedProduct.image,
                              id: _editedProduct.id);
                        },
                      ),
                      // -- TITLE FORM FIELD

                      // DESCRIPTION FORM FIELD
                      TextFormField(
                        initialValue: _initValues['desc'],
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                        cursorColor: Colors.black12,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        focusNode: _descriptionFocusNode,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a description.';
                          }
                          if (value.length < 10) {
                            return 'Should be at least 10 characters long.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              name: _editedProduct.name,
                              price: _editedProduct.price,
                              desc: value,
                              image: _editedProduct.image,
                              id: _editedProduct.id);
                        },
                      ),
                      // -- DESCRIPTION FORM FIELD

                      // START DATE FORM FIELD
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Expanded(
                            flex: 4,
                            child: new _InputDropdown(
                              labelText: "Start Date",
                              valueText:
                                  "${selectedStartDate.day}/${selectedStartDate.month}/${selectedStartDate.year}",
                              onPressed: () {
                                _selectStartDate(context);
                              },
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          new Expanded(
                            flex: 3,
                            child: new _InputDropdown(
                              valueText:
                                  "${selectedStartTime.hour}:${selectedStartTime.minute}",
                              onPressed: () {
                                _selectStartTime(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      // -- START DATE FORM FIELD

                      // END DATE FORM FIELD
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Expanded(
                            flex: 4,
                            child: new _InputDropdown(
                              labelText: "End Date",
                              valueText:
                                  "${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}",
                              onPressed: () {
                                _selectEndDate(context);
                              },
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          new Expanded(
                            flex: 3,
                            child: new _InputDropdown(
                              valueText:
                                  "${selectedEndTime.hour}:${selectedEndTime.minute}",
                              onPressed: () {
                                _selectEndTime(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      // -- END DATE FORM FIELD

                      // IMAGE FORM FIELD
                       Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 200,
                          margin: EdgeInsets.only(
                            top: 30,
                          ),
                          
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children:<Widget>[
                              
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0,0,0,0),
                                  child: _imageUrlController.text.isEmpty
                                  ? Container(                                 
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 65),
                                          child: Icon(
                                            Icons.photo_camera, color: Colors.grey.withOpacity(0.5), size: 50,),
                                        ),
                                        Text(
                                          'Image URl',
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                  : FittedBox(
                                    child: Image.network(
                                      _imageUrlController.text,
                                      height: 198,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              )
                            ]
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Image URL',
                              labelStyle: TextStyle(color: Colors.black54),
                            ),
                            cursorColor: Colors.black12,
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an image URL.';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL.';
                              }
                              if (!value.endsWith('.png') &&
                                  !value.endsWith('.jpg') &&
                                  !value.endsWith('.jpeg')) {
                                return 'Please enter a valid image URL.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                  name: _editedProduct.name,
                                  price: _editedProduct.price,
                                  desc: _editedProduct.desc,
                                  image: value,
                                  id: _editedProduct.id);
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                            child: RaisedButton(
                              child: Text(
                                'Simpan',
                                style: TextStyle(color: Colors.white),
                                ),
                                color: Color.fromARGB(255, 255, 119, 0),
                                onPressed: _saveForm,
                              ),
                        ),
                      ],
                    ),
                    ],
                  ),
                ),
              ),
          ),
    );
  }
}
