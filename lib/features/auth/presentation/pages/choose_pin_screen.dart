import 'package:flutter/material.dart';
import 'package:pretium/features/app/const_colours/colors.dart';
import 'package:pretium/features/routes/route_names.dart';

class ChoosePinScreen extends StatefulWidget {
  final Function(String) onPinConfirmed;

  const ChoosePinScreen({Key? key, required this.onPinConfirmed})
    : super(key: key);

  @override
  State<ChoosePinScreen> createState() => _ChoosePinScreenState();
}

class _ChoosePinScreenState extends State<ChoosePinScreen> {
  String _pin = '';
  String? _initialPin;
  String _errorMessage = '';
  final int _pinLength = 4;
  bool _isConfirmMode = false;

  void _addDigit(String digit) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin += digit;
        _errorMessage = '';
      });

      if (_pin.length == _pinLength) {
        _handlePinComplete();
      }
    }
  }

  void _removeDigit() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
        _errorMessage = '';
      });
    }
  }

  void _handlePinComplete() {
    if (!_isConfirmMode) {
      setState(() {
        _initialPin = _pin;
        _pin = '';
        _isConfirmMode = true;
      });
    } else {
      if (_pin == _initialPin) {
        Future.delayed(const Duration(milliseconds: 200), () {
          widget.onPinConfirmed(_pin);

          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, RouteNames.logIn);
        });
      } else {
        setState(() {
          _errorMessage = 'PINs do not match. Please try again.';
          _pin = '';
          _initialPin = null;
          _isConfirmMode = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.height < 600;

    return Scaffold(
      backgroundColor: primaryColour,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            Icon(
              Icons.lock_rounded,
              size: isSmallScreen ? 60 : 80,
              color: Colors.white,
            ),

            SizedBox(height: isSmallScreen ? 16 : 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _isConfirmMode
                    ? 'Re-enter your PIN to confirm'
                    : 'Enter a new PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 20 : 24,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: isSmallScreen ? 8 : 12),

            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red[300],
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pinLength,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: isSmallScreen ? 16 : 20,
                  height: isSmallScreen ? 16 : 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    color:
                        index < _pin.length ? Colors.white : Colors.transparent,
                  ),
                ),
              ),
            ),

            SizedBox(height: isSmallScreen ? 16 : 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Your PIN will be required to access the app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 14 : 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(flex: 3),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.15,
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                mainAxisSpacing: isSmallScreen ? 8 : 16,
                crossAxisSpacing: isSmallScreen ? 8 : 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...List.generate(9, (index) {
                    final number = (index + 1).toString();
                    return _buildKeypadButton(number);
                  }),
                  const SizedBox(),
                  _buildKeypadButton('0'),
                  _buildBackspaceButton(),
                ],
              ),
            ),

            SizedBox(height: isSmallScreen ? 24 : 36),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String digit) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _addDigit(digit),
        customBorder: const CircleBorder(),
        child: Center(
          child: Text(
            digit,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _removeDigit,
        customBorder: const CircleBorder(),
        child: const Center(
          child: Icon(Icons.backspace_outlined, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
