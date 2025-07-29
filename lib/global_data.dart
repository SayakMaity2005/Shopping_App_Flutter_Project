final List<String> appleModels = [
  "iPhone 16 Pro Max",
  "iPhone 16 Pro",
  "iPhone 16 Plus",
  "iPhone 16",
  // "iPhone 16e",
  "iPhone 15 Pro Max",
  "iPhone 15 Pro",
  "iPhone 15 Plus",
  "iPhone 15",
];

final Map<String, Apple> appleModelsData = {
  // Latest (2024–2025)
  "iPhone 16 Pro Max": Apple(
    model: {
      ModelVariant.modelName: "iPhone 16 Pro Max",
      ModelVariant.modelNumber: "MYWV3HN/A",
    },
    colors: {
      "Black Titanium":
          "https://drive.google.com/uc?export=view&id=1e0Z8g5ivBLo1tT3kvZhEArjAyLpqeB6_",
      "Desert Titanium":
          "https://drive.google.com/uc?export=view&id=1Nzx8hExewMgoTuqTQPAN8Av9dUlBRWMX",
      "Natural Titanium":
          "https://drive.google.com/uc?export=view&id=1p79Gxor54RNktIAzSuV8AoL6yp5dvTva",
      "White Titanium":
          "https://drive.google.com/uc?export=view&id=1_ji35EPPb8KvmykQLh7iGxiB1EuWNWIo",
    },
    defaultColor: "Black Titanium",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [256, 512, 1024],
    defaultStorage: 1024,
    priceVariant: {"8-256": 135900, "8-512": 157900, "8-1024": 177900},
    features: {
      "Processor": "A18 Pro (2 P‑cores + 4 E‑cores)",
      "Rear Camera":
          "48MP wide + 12MP telephoto periscope + 48MP (ultra‑wide) + LiDAR",
      "Front Camera": "12MP",
      "Display": "6.9 inch OLED, 120Hz ProMotion",
      "Battery": "Largest ever, MagSafe Qi2, USB‑C",
      "RAM": "8GB",
      "5G/Connectivity": "Wi‑Fi 7, Bluetooth 5.3, dual eSIM",
    },
  ),
  "iPhone 16 Pro": Apple(
    model: {
      ModelVariant.modelName: "iPhone 16 Pro",
      ModelVariant.modelNumber: "AYYYY",
    },
    colors: {
      "Black Titanium":
          "https://drive.google.com/uc?export=view&id=1sNUjgQ2tSoYfjskERmtaoCHpqFQffPy3",
      "Desert Titanium":
          "https://drive.google.com/uc?export=view&id=1Nzx8hExewMgoTuqTQPAN8Av9dUlBRWMX",
      "Natural Titanium":
          "https://drive.google.com/uc?export=view&id=1p79Gxor54RNktIAzSuV8AoL6yp5dvTva",
      "White Titanium":
          "https://drive.google.com/uc?export=view&id=1_ji35EPPb8KvmykQLh7iGxiB1EuWNWIo",
    },
    defaultColor: "Black Titanium",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [128, 256, 512, 1024],
    defaultStorage: 1024,
    priceVariant: {
      "8-128": 112900,
      "8-256": 122900,
      "8-512": 142900,
      "8-1024": 162900,
    },
    features: {
      "Processor": "A18 Pro",
      "Rear Camera": "48MP + 12MP + 48MP + LiDAR",
      "Front Camera": "12MP",
      "Display": "6.3 inch OLED, 120Hz ProMotion",
      "Battery": "Largest ever, MagSafe + Qi2, USB‑C",
      "RAM": "8GB",
      "5G/Connectivity": "Wi‑Fi 7, Bluetooth 5.3, dual eSIM",
    },
  ),
  "iPhone 16 Plus": Apple(
    model: {
      ModelVariant.modelName: "iPhone 16 Plus",
      ModelVariant.modelNumber: "AZZZZ",
    },
    colors: {
      "Black":
          "https://drive.google.com/uc?export=view&id=1AZ-hDHq8fxfoedzfyyvD5dZcqo8Gj9qH",
      "Pink":
          "https://drive.google.com/uc?export=view&id=1Bvgna-G0BcUKh6jBSMtYuen70PhAYIV_",
      "Teal":
          "https://drive.google.com/uc?export=view&id=1tCzws4UbIyETKvxHhlfUylFH8W4gctRg",
      "Ultramarine":
          "https://drive.google.com/uc?export=view&id=1vHlrvdm2TkDrgXBrW7B7RnhKj90sqCVw",
      "White":
          "https://drive.google.com/uc?export=view&id=1j7tBJzoR--HHl4zY79UUQ8KJtlpMo8rx",
    },
    defaultColor: "Teal",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [128, 256, 512],
    defaultStorage: 512,
    priceVariant: {"8-128": 84900, "8-256": 94900, "8-512": 114900},
    features: {
      "Processor": "A18",
      "Rear Camera": "48MP + ultra‑wide",
      "Front Camera": "12MP",
      "Display": "6.69 inch OLED",
      "Battery": "Largest ever, MagSafe + Qi2, USB‑C",
      "RAM": "8GB",
      "5G/Connectivity": "Wi‑Fi 7, Bluetooth 5.3, dual eSIM",
    },
  ),
  "iPhone 16": Apple(
    model: {
      ModelVariant.modelName: "iPhone 16",
      ModelVariant.modelNumber: "AXXXX",
    },
    colors: {
      "Black":
          "https://drive.google.com/uc?export=view&id=1AZ-hDHq8fxfoedzfyyvD5dZcqo8Gj9qH",
      "Pink":
          "https://drive.google.com/uc?export=view&id=1Bvgna-G0BcUKh6jBSMtYuen70PhAYIV_",
      "Teal":
          "https://drive.google.com/uc?export=view&id=1tCzws4UbIyETKvxHhlfUylFH8W4gctRg",
      "Ultramarine":
          "https://drive.google.com/uc?export=view&id=1vHlrvdm2TkDrgXBrW7B7RnhKj90sqCVw",
      "White":
          "https://drive.google.com/uc?export=view&id=1j7tBJzoR--HHl4zY79UUQ8KJtlpMo8rx",
    },
    defaultColor: "White",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [128, 256, 512],
    defaultStorage: 512,
    priceVariant: {"8-128": 74900, "8-256": 84900, "8-512": 104900},
    features: {
      "Processor": "A18",
      "Rear Camera": "48MP + ultra‑wide",
      "Front Camera": "12MP",
      "Display": "6.12 inch OLED",
      "Battery": "Largest ever, MagSafe Qi2",
      "RAM": "8GB",
      "5G/Connectivity": "Wi‑Fi 7, Bluetooth 5.3, dual eSIM",
    },
  ),
  // "iPhone 16e": Apple(
  //   model: {
  //     ModelVariant.modelName: "iPhone 16e",
  //     ModelVariant.modelNumber: "A3212", // example
  //   },
  //   colors: ["Standard shades"],
  //   ramVariants: [8],
  //   storageVariants: [128, 256],
  //   features: {
  //     "Processor": "A18 (4‑core GPU)",
  //     "Rear Camera": "48MP Fusion single camera",
  //     "Front Camera": "12MP",
  //     "Display": "6.1 inch OLED",
  //     "Omissions": "No ultra‑wide, MagSafe, Qi2",
  //   },
  // ),

  // --- iPhone 15 Pro Max ---
  "iPhone 15 Pro Max": Apple(
    model: {
      ModelVariant.modelName: "iPhone 15 Pro Max",
      ModelVariant.modelNumber: "A…", // Apple SKU
    },
    colors: {
      "Black Titanium":
          "https://drive.google.com/uc?export=view&id=19U1JZf5YEAhilONR36Xcomv_2naXzeHm",
      "Blue Titanium":
          "https://drive.google.com/uc?export=view&id=1d8tWq5e1o5o29JHM2gM7fF1RrgYOSy-M",
      "Natural Titanium":
          "https://drive.google.com/uc?export=view&id=15DNjf8fIL6vMSy_G10ZQF6MSnltqj30d",
      "White Titanium":
          "https://drive.google.com/uc?export=view&id=17cFJpqDtznkhpGVg4N6NCSODiwc3p_uN",
    },
    defaultColor: "Natural Titanium",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [256, 512, 1024],
    defaultStorage: 1024,
    priceVariant: {"8-256": 99499, "8-512": 104999, "8-1024": 108999},
    features: {
      "Processor": "A17 Pro (3 nm, Hexa‑core CPU, 6‑core GPU)",
      "Rear Camera":
          "48MP wide + 12MP ultra‑wide + 12MP tele (5× zoom) + LiDAR",
      "Front Camera": "12MP (OIS)",
      "Display": "6.7 inch Super Retina XDR OLED, 120Hz",
      "Battery": "MagSafe Qi2",
      "Connectivity": "5G, Wi‑Fi 6E, BT 5.3, UWB2, NFC, Dual SIM",
    },
  ),

  // --- iPhone 15 Pro ---
  "iPhone 15 Pro": Apple(
    model: {
      ModelVariant.modelName: "iPhone 15 Pro",
      ModelVariant.modelNumber: "A…",
    },
    colors: {
      "Black Titanium":
          "https://drive.google.com/uc?export=view&id=19U1JZf5YEAhilONR36Xcomv_2naXzeHm",
      "Blue Titanium":
          "https://drive.google.com/uc?export=view&id=1d8tWq5e1o5o29JHM2gM7fF1RrgYOSy-M",
      "Natural Titanium":
          "https://drive.google.com/uc?export=view&id=15DNjf8fIL6vMSy_G10ZQF6MSnltqj30d",
      "White Titanium":
          "https://drive.google.com/uc?export=view&id=17cFJpqDtznkhpGVg4N6NCSODiwc3p_uN",
    },
    defaultColor: "Natural Titanium",
    ramVariants: [8],
    defaultRam: 8,
    storageVariants: [128, 256, 512, 1024],
    defaultStorage: 1024,
    priceVariant: {
      "8-128": 90999,
      "8-256": 94999,
      "8-512": 99499,
      "8-1024": 104999,
    },
    features: {
      "Processor": "A17 Pro (3 nm, Hexa‑core CPU, 6‑core GPU)",
      "Rear Camera":
          "48MP wide + 12MP ultra‑wide + 12MP tele (3× zoom) + LiDAR",
      "Front Camera": "12MP",
      "Display": "6.1 inch Super Retina XDR OLED, 120Hz",
      "Battery": "MagSafe Qi2",
      "Connectivity": "5G, Wi‑Fi 6E, BT 5.3, UWB2, NFC, Dual SIM",
    },
  ),

  // --- iPhone 15 Plus ---
  "iPhone 15 Plus": Apple(
    model: {
      ModelVariant.modelName: "iPhone 15 Plus",
      ModelVariant.modelNumber: "A…",
    },
    colors: {
      "Black":
          "https://drive.google.com/uc?export=view&id=1CK8Fu9hx15Un7ncAk2-dIsO8zYhHcUIq",
      "Blue":
          "https://drive.google.com/uc?export=view&id=1UKWa8Y31fCKlBpIGQqXk4OAKQbrGNqVE",
      "Green":
          "https://drive.google.com/uc?export=view&id=1wX_097adhXZnuf263vAsuLNdt2cYnUTW",
      "Yellow":
          "https://drive.google.com/uc?export=view&id=1neT4hXMjiUEH76J1ohNZd8DdRLLThrpO",
      "Pink":
          "https://drive.google.com/uc?export=view&id=1UBiPvzLp01HR0CtPeC1e6FL4o9AibtgG",
    },
    defaultColor: "Blue",
    ramVariants: [6],
    defaultRam: 6,
    storageVariants: [128, 256, 512],
    defaultStorage: 512,
    priceVariant: {"6-128": 74900, "6-256": 84900, "6-512": 104900},
    features: {
      "Processor": "A16 Bionic",
      "Display": "6.7 inch Super Retina XDR OLED, 60Hz",
      "Rear Camera": "48MP wide + 12MP ultra‑wide",
      "Front Camera": "12MP TrueDepth",
      "Battery": "MagSafe Qi2",
      "Connectivity": "5G, Wi‑Fi 6, BT 5.3, NFC",
    },
  ),

  // --- iPhone 15 ---
  "iPhone 15": Apple(
    model: {
      ModelVariant.modelName: "iPhone 15",
      ModelVariant.modelNumber: "A…",
    },
    colors: {
      "Black":
          "https://drive.google.com/uc?export=view&id=1CK8Fu9hx15Un7ncAk2-dIsO8zYhHcUIq",
      "Blue":
          "https://drive.google.com/uc?export=view&id=1UKWa8Y31fCKlBpIGQqXk4OAKQbrGNqVE",
      "Green":
          "https://drive.google.com/uc?export=view&id=1wX_097adhXZnuf263vAsuLNdt2cYnUTW",
      "Yellow":
          "https://drive.google.com/uc?export=view&id=1neT4hXMjiUEH76J1ohNZd8DdRLLThrpO",
      "Pink":
          "https://drive.google.com/uc?export=view&id=1UBiPvzLp01HR0CtPeC1e6FL4o9AibtgG",
    },
    defaultColor: "Pink",
    ramVariants: [6],
    defaultRam: 6,
    storageVariants: [128, 256, 512],
    defaultStorage: 512,
    priceVariant: {"6-128": 64900, "6-256": 74900, "6-512": 94900},
    features: {
      "Processor": "A16 Bionic",
      "Rear Camera": "48MP wide + 12MP ultra‑wide",
      "Front Camera": "12MP TrueDepth",
      "Display": "6.1 inch Super Retina XDR OLED, 60Hz",
      "Battery": "MagSafe Qi2",
      "Connectivity": "5G, Wi‑Fi 6, BT 5.3, NFC",
    },
  ),
};

// "iPhone 16 Pro", "iPhone 16 Plus", "iPhone 16", "iPhone 16e", "iPhone 15 Pro Max", "iPhone 15 Pro", "iPhone 15 Plus", "iPhone 15", "iPhone 14 Plus", "iPhone 14", "iPhone 13", "iPhone SE (3rd Gen)"',

///////////////////////////////// Iqoo data ///////////////////////////////////
final List<String> iqooModels = ["iQOO Z10 Lite 5G", "iQOO Z10", "iQOO Neo 10"];
final Map<String, Iqoo> iqooModelsData = {
  // Latest (2024–2025)
  "iQOO Z10 Lite 5G": Iqoo(
    model: {
      ModelVariant.modelName: "iQOO Z10 Lite 5G",
      ModelVariant.modelNumber: "Z10 Lite",
    },
    colors: {
      "Titanium Blue":
          "https://drive.google.com/uc?export=view&id=18fMcs1n4jSLD8uqG6T3mUoLpxu8hDWgl",
      "Cyber Green":
          "https://drive.google.com/uc?export=view&id=1hxxr0WPSCGsq53HnE-udN_aIToGaIV9t",
    },
    defaultColor: "Titanium Blue",
    ramVariants: [4, 6, 8],
    defaultRam: 8,
    storageVariants: [128, 256],
    defaultStorage: 256,
    priceVariant: {
      "4-128": 11097,
      "6-128": 11857,
      "6-256": 15499,
      "8-256": 17099,
    },
    features: {
      "Processor": "MediaTek Dimensity 6300, octa-core 2.4 GHz",
      "Display": "6.74 inch IPS, HD+, 90 Hz",
      "Rear Camera": "50MP + 2MP",
      "Front Camera": "5MP",
      "Battery": "6000 mAh",
      "Connectivity": "5G, Wi‑Fi 7, Bluetooth 5.3, Dual SIM, USB‑C",
    },
  ),

  "iQOO Z10": Iqoo(
    model: {
      ModelVariant.modelName: "iQOO Z10",
      ModelVariant.modelNumber: "Z10",
    },
    colors: {
      "Stellar Black":
          "https://drive.google.com/uc?export=view&id=1YzFnouPEFTV7wYKzlbmM-HI_k-GOV9Ax",
      "Glacial Silver":
          "https://drive.google.com/uc?export=view&id=1r7DgHvc3-FEjslZVmyxkIwRDmnQ9fDg1",
    },
    defaultColor: "Stellar Black",
    ramVariants: [8, 12],
    defaultRam: 12,
    storageVariants: [128, 256],
    defaultStorage: 256,
    priceVariant: {"8-128": 21400, "8-256": 23300, "12-256": 25400},
    features: {
      "Processor": "Snapdragon 7s Gen 3 (Octa‑core up to 2.5 GHz)",
      "Display": "6.77 inch AMOLED, FHD+ , 120 Hz, 5000 nit peak",
      "Rear Camera": "50MP (OIS) + 2MP depth",
      "Front Camera": "32MP",
      "Charging": "90W fast charge",
      "Battery": "7300 mAh",
      "Connectivity": "5G, Wi‑Fi 6, Bluetooth 5.2, USB‑C, Dual SIM",
    },
  ),

  "iQOO Neo 10": Iqoo(
    model: {
      ModelVariant.modelName: "iQOO Neo 10",
      ModelVariant.modelNumber: "Neo 10",
    },
    colors: {
      "Titanium Chrome":
          "https://drive.google.com/uc?export=view&id=1wVIg-YhTcl-pWU0CJoZFmIp8hq3kkSHj",
      "Inferno Red":
          "https://drive.google.com/uc?export=view&id=1KemzJFIX9SSJgQumFnlCJxfa-b-u7pns",
    },
    defaultColor: "Titanium Chrome",
    ramVariants: [8, 12, 16],
    defaultRam: 16,
    storageVariants: [128, 256, 512],
    defaultStorage: 512,
    priceVariant: {
      "8-128": 35000,
      "8-256": 34599,
      "12-256": 38999,
      "16-512": 43989,
    },
    features: {
      "Processor": "Snapdragon 8s Gen 4 + Q1 Supercomputing Chip",
      "Display": "6.78 inch AMOLED, 1.5K, 144 Hz, 5500 nit peak",
      "Rear Camera": "50MP Sony OIS + 8MP",
      "Front Camera": "32MP",
      "Battery": "7000 mAh",
      "Charging": "120W fast charge)",
      "Connectivity": "5G, Wi‑Fi 7, Bluetooth 5.4, USB‑C, Dual SIM",
    },
  ),
};

class Mobile {
  // final List<String> models;
  final Map<ModelVariant, String> model;
  final Map<String, String> colors;
  String defaultColor;
  final List<int> storageVariants;
  int defaultStorage;
  final List<int> ramVariants;
  int defaultRam;
  final Map<String, int> priceVariant;
  final Map<String, dynamic> features;
  Mobile({
    required this.model,
    required this.colors,
    required this.defaultColor,
    required this.storageVariants,
    required this.defaultStorage,
    required this.ramVariants,
    required this.defaultRam,
    required this.priceVariant,
    required this.features,
  });
}

class MobileDetailsCart {
  final Mobile brandModelsData;
  final int ram;
  final int storage;
  final String color;
  MobileDetailsCart({
    required this.brandModelsData,
    required this.ram,
    required this.storage,
    required this.color,
  });
}

class Apple extends Mobile {
  Apple({
    required super.model,
    required super.colors,
    required super.defaultColor,
    required super.features,
    required super.storageVariants,
    required super.defaultStorage,
    required super.ramVariants,
    required super.priceVariant,
    required super.defaultRam,
  });
}

class Iqoo extends Mobile {
  Iqoo({
    required super.model,
    required super.colors,
    required super.defaultColor,
    required super.features,
    required super.storageVariants,
    required super.defaultStorage,
    required super.ramVariants,
    required super.priceVariant,
    required super.defaultRam,
  });
}

enum ModelVariant { modelName, modelNumber }

enum Brands {
  all,
  apple,
  iQOO,
  motorola,
  nothing,
  oPPO,
  onePlus,
  pixel,
  realme,
  samsung,
  vivo,
}
