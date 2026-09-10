# DMuffler (Digital Muffler) Apple Apps

![Platform](https://img.shields.io/badge/Platforms-iOS%20%7C%20iPadOS%20%7C%20watchOS%20%7C%20macOS-blue?style=flat-square)
![Swift](https://img.shields.io/badge/Swift-5.0+-orange.svg?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)

**DMuffler** (pun of launchd) is an ecosystem of apps (Swift & Python) designed to bring dynamic, customizable engine and exhaust audio profiles to the modern electric vehicles (EV) and hybrid vehicles. See (https://evcustoms.org)[https://evcustoms.org/] for more details. 
Built entirely in Swift, the DMuffler Apple Apps runs natively on all four major Apple platforms, allowing you to control and customize your EV's acoustic footprint right from your wrist, tablet, phone, or personal computer (just not on PC or Android yet, coming March 2028.

> Here’s to the sound creators. The tone tweakers. The noise makers.*
*The ones who hear things differently. **Sound Different!**

---

## 🏎 How It Works

The **DMuffler** ecosystem bridges native Apple frontend apps with a custom Raspberry Pi-based backend:

1. **Frontend App (Swift UI):** Runs on your iOS, iPadOS, watchOS, or macOS device. It acts as the command center for selecting sound profiles, viewing telemetry, and customizing vehicle audio settings.
2. **Compute Module Dongle (Python Backend):** A Raspberry Pi CM4 housed in your vehicle intercepts real-time CAN bus / OBD-2 telemetry (speed, throttle position, RPM)  to generate dynamically pitch-shifted exhaust audio, which is Bluetooth streamed in high quality to your vehicle internal speakers using the (aptX)[https://en.wikipedia.org/wiki/AptX] audio data compression codecs.
3. **Muffler Hardware (coming March 2028):** A custom physical 3D-printed enclosure with magnets attaches to your vehicle and projects  synthesized acoustics externally, if desired. You can turn this off at any time to keep the neighbors happy. 

---

## 🛠 Hardware Requirements

To experience the full integration of the DMuffler ecosystem, the following development and deployment hardware is required.
### For Desktop Development:
To hack (correctly defined as "A transparent, community-shared modification or repurposing of hardware or software to solve a problem in a way the original creator did not intend.") the DMuffler ecosystem you will need:
| Component | Description | Source / Part Number |
| :--- | :--- | :--- |
| **Compute Module** | Raspberry Pi Compute Module 4 | [Pi Foundation P/N CM4](https://www.raspberrypi.com/products/compute-module-4) |
| **Carrier Board** | Dual Gigabit Carrier Board for CM4 | [SeeedStudio SKU 102110497](https://wiki.seeedstudio.com/Dual-Gigabit-Ethernet-Carrier-Board-for-Raspberry-Pi-CM4/#fpc-interface) |
| Apple Device | iPhone 11 (or newer) or MacOS 27+ (Golden Gate) | [](https://wiki.seeedstudio.com/Dual-Gigabit-Ethernet-Carrier-Board-for-Raspberry-Pi-CM4/#fpc-interface) ???? |

### For In-Car Deployment:
To use the DMuffler ecosystem inside your vehicle you will need:
| Component | Description | Source / Part Number |
| :--- | :--- | :--- |
| **Hardware Dongle** | CANOPi CAN Bus Interface | [TesCustoms P/N 100-0001-A](https://github.com/TesCustoms/TesMufflerDongle) |
| **Compute Module** | Raspberry Pi Compute Module 4 | [Pi Foundation P/N CM4](https://www.raspberrypi.com/products/compute-module-4) |
| **Adapter Harness** | OHP OBD2 Adapter Harness | [Manufacturer P/N 10246](https://www.amazon.com/dp/B08DXY5KVX) |
| Apple Device| iPhone 11 (or newer) / Apple Watch Series 9 (or newer) Ultra 2 (or newer) or SE3 (or newer) / iPad Air (3rd Gen or newer) or iPad (8th Gen or newer) or iPad Mini (5th Gen or newer) or iPad Pro 1st Gen or newer) / MacOS 27+ (Golden Gate) | [](https://wiki.seeedstudio.com/Dual-Gigabit-Ethernet-Carrier-Board-for-Raspberry-Pi-CM4/#fpc-interface) ???? |
| **Physical Muffler** | Custom 3D printed muffler with magnets | [TesMufflerCADv1.stl](https://github.com/OpenSourceIronman/Tes/blob/master/TesMuffler/TesMufflerCADv1.stl) |

---

## 🛰 Integrated APIs & Libraries

The system is designed with exploration of several industry-standard and custom automotive APIs:

* **Tesla API:** Utilizes reverse-engineered telemetry APIs from the Tesla community (https://teslaapi.dev/) and https://teslascope.com.
* **Smartcar API:** Reads vehicle telemetry (location, odometer, lock state) via robust SDK interfaces.
* **Comma Pedal & Panda:** Integrates with gas pedal interceptor and Comma.ai open-source vehicle interface libraries (like panda) to read granular, low-latency throttle inputs directly from the ECU.

---

## 🔊 Demo Vehicle Audio Profiles

DMuffler is pre-configured to simulate seven exhaust signatures for a wide variety of legendary performance cars, electric vehicles, and sci-fi crafts. You can download and extract audio tracks using the `youtube-dl --extract-audio --audio-format mp3` command from the following sources:

* **McLaren F1** (https://www.youtube.com/watch?v=mOI8GWoMF4M)
* **Ferrari LaFerrari** (https://www.youtube.com/watch?v=B4Th3LxCgb4)
* **Porsche 911** (https://www.youtube.com/watch?v=O1Kyt1qDL30)
* **BMW M4** (https://www.youtube.com/watch?v=0RFoYCG4_TE)
* **Jaguar E-Type Series 1** (https://www.youtube.com/watch?v=44sNpPYw5Bo)
* **Ford Model T** (https://www.dailymotion.com/video/x35n5if)
* **Subaru WRX STI** (https://youtu.be/d7Gszyz62e0?t=193)
* **Star Wars Podracer** (https://www.youtube.com/watch?v=f7ogSqLwNQ0)
* **Tesla Motor Whine** (Direct drivetrain whine) (https://www.youtube.com/watch?v=j4AxsGk-LdQ)

## Custom Vehicle Audio Profiles
To add additonal custom exhaust signatures you will need to purchase and download them from the EV Customs Sound Store, wherea community of artists from around Earth have created refined sounds for your enjoyment.
Three easy steps:
1. Visit www.evcustoms.store on your iPhone, iPad, or Mac to purchase and download to your Apple device. 
2. 


---

## 🚀 Installation & Setup

### Apple Application (Frontend)

#### Requirements
* **iOS / iPadOS / watchOS / macOS:** Version 27.0+
* **Xcode:** Version 27.0 or later
* **Language:** Swift 5.0+

#### Installation
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/EV-Customs/DMuffler-Apple-Apps.git
   ```
2. Open the workspace in Xcode:
   ```bash
   open Files.xcworkspace
   ```
3. Select your active scheme (e.g. iOS App, watchOS App) and destination device/simulator.
4. Build and Run the project (`Cmd + R`).

---

### Compute Module (Backend)

The backend code is run on the Raspberry Pi CM4 and handles vehicle communication, audio synthesis, and Bluetooth/WiFi connectivity with the Apple App.

#### Installation
1. Flash your Pi CM4 with Raspberry Pi OS.
2. Clone the companion repository:
   ```bash
   git clone https://github.com/EV-Customs/DMuffler-PiComputeModule.git
   ```
3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Run the main server loop:
   ```bash
   python Main.py
   ```

---

## 💻 Backend Usage & Integration Code Examples

The backend Python codebase implements key functionalities that help control real-time connection and sound generation. Here is how you can use them:

### 1. Reliable Connection with Retries
The backend establishes a robust OBD2/Dongle connection using the `connect_with_retry` function:

```python
import time
from BluetoothConnector import connect_with_retry

# Attempt connection to the vehicle interface with 5 retries
device = connect_with_retry(max_retries=5, delay=1)

if device:
    print("Successfully connected to the vehicle dongle")
else:
    print("Failed to establish vehicle connection after retries")
```

### 2. Live Pitch-Shifting (Simulating Engine RPM)
To make sounds feel reactive to your EV's throttle, the engine audio generator shifts the pitch of an audio file dynamically based on RPM telemetry:

```python
import numpy as np
import sounddevice as sd
from EngineSoundPitchShifter import example_pitch_shift

# Generate a basic sample audio signal (representing an engine note)
sample_rate = 44100
frequency = 440  # Hz
duration = 1     # Second
t = np.linspace(0, duration, int(sample_rate * duration), False)
engine_tone = np.sin(frequency * t * 2 * np.pi)

# Shift the pitch of the engine note by 2 semitones to simulate accelerating
shifted_tone = example_pitch_shift(engine_tone, sample_rate, semitones=2)

# Play the pitch-shifted engine sound
sd.play(shifted_tone, sample_rate)
sd.wait()
```

---

## ⚖️ Why Digital Mufflers Exist?

1. **Safety Regulations (NHTSA):** Electric vehicles are incredibly quiet at low speeds, posing risks to pedestrians. Many transport authorities have mandated minimum sound requirements for hybrid and electric vehicles (see [NHTSA Minimum Sound Requirements](https://www.nhtsa.gov/sites/nhtsa.gov/files/documents/812347-minimumsoundrequirements.pdf)).
2. **Acoustic Experience:** Car enthusiasts miss the raw mechanical feedback of traditional combustion engines. DMuffler brings back that thrill without compromising on EV efficiency. Even Elon Musk has expressed a deep fondness for gas-engine cars (owning vintage classics alongside his Teslas).

---

## 📬 Support & Community

* **Developer & Support Email:** dev@evcustoms.store
* **Creator Tweet:** @X\_BlazeSanders
* **Issues:** Submit questions or bug reports via our GitHub Issues page.
