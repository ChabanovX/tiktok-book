const defaultReadingWpm = 300;

const List<int> readingSpeedOptions = [200, 250, 300, 350, 400, 450, 500, 550, 600];

bool isSupportedReadingWpm(int value) => readingSpeedOptions.contains(value);
