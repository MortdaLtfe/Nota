class NoteListController {
  final _notes = [
    {
      "title": "Meeting Reminder",
      "date": "2023-02-20",
      "content": "Don't forget to attend the team meeting at 2 PM today!"
    },
    {
      "title": "Project Deadline",
      "date": "2023-03-01",
      "content":
          "The project deadline is approaching, make sure to submit your work on time!"
    },
    {
      "title": "Doctor's Appointment",
      "date": "2023-02-25",
      "content":
          "You have a doctor's appointment scheduled for 10 AM tomorrow, don't forget to go!"
    },
    {
      "title": "Birthday Reminder",
      "date": "2023-03-15",
      "content":
          "It's your friend's birthday tomorrow, don't forget to send a gift or card!"
    },
    {
      "title": "Travel Plans",
      "date": "2023-04-01",
      "content":
          "You have a flight booked for April 1st, make sure to check-in online and arrive at the airport on time!"
    }
  ];
  List<Map<String, dynamic>> get notes => _notes;
}
