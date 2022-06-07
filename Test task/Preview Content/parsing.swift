let jsonData = """
{
  "IUPSid" : "6020fdd49607af09001d5aeb",
  "Title" : "ИНДИВИДУАЛЬНЫЙ УЧЕБНЫЙ ПЛАН СТУДЕНТА №2018-24907",
  "DocumentURL" : "https://univer.curs.kz/api/references/docimage/62048ee24357dc8908c0e577",
  "AcademicYearId" : "1",
  "AcademicYear" : "2018-2019 учебный год",
  "Semesters" : [
      {
          "Number": "5",
          "Disciplines" : [
              {
                  "DisciplineId" : "5d762432cbbc35013c1dff3f",
                  "DisciplineName" : {
                      "nameKk" : "Электрохимия (ағылшын)",
                      "nameRu" : "Электрохимия на англ. Яз ",
                      "nameEn" : "Electrochemistry"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "10"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "15",
                          "RealHours" : "5"
                      },
                      {
                          "LessonTypeId" : "3",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              },
              {
                  "DisciplineId" : "5d762431cbbc35013c1df220",
                  "DisciplineName" : {
                      "nameKk" : "Шет тілі C1",
                      "nameRu" : "Иностранный язык C1",
                      "nameEn" : "Foreign language C1"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "30"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "15",
                          "RealHours" : "15"
                      },
                      {
                          "LessonTypeId" : "3",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              },
              {
                  "DisciplineId" : "5d762431cbbc35013c1df2a6",
                  "DisciplineName" : {
                      "nameKk" : "Химиялық анализ негіздері",
                      "nameRu" : "Основы химического анализа",
                      "nameEn" : "Fundamentals of chemical analysis"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "10"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              }
          ]
      },
      {
          "Number": "7",
          "Disciplines" : [
              {
                  "DisciplineId" : "5d762432cbbc35013c1dff3f",
                  "DisciplineName" : {
                      "nameKk" : "Электрохимия (ағылшын)",
                      "nameRu" : "Электрохимия на англ. Яз ",
                      "nameEn" : "Electrochemistry"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "10"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "15",
                          "RealHours" : "1"
                      },
                      {
                          "LessonTypeId" : "3",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              },
              {
                  "DisciplineId" : "5d762431cbbc35013c1df220",
                  "DisciplineName" : {
                      "nameKk" : "Шет тілі C1",
                      "nameRu" : "Иностранный язык C1",
                      "nameEn" : "Foreign language C1"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "30"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "15",
                          "RealHours" : "15"
                      },
                      {
                          "LessonTypeId" : "3",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              },
              {
                  "DisciplineId" : "5d762431cbbc35013c1df2a6",
                  "DisciplineName" : {
                      "nameKk" : "Химиялық анализ негіздері",
                      "nameRu" : "Основы химического анализа",
                      "nameEn" : "Fundamentals of chemical analysis"
                  },
                  "Lesson" : [
                      {
                          "LessonTypeId" : "1",
                          "Hours" : "30",
                          "RealHours" : "10"
                      },
                      {
                          "LessonTypeId" : "2",
                          "Hours" : "30",
                          "RealHours" : "10"
                      }
                  ]
              }
          ]
      }
  ]
}
"""

import Foundation

public struct Welcome: Codable, Hashable {
    public let iupSid: String?
    public let title: String?
    public let documentURL: String?
    public let academicYearID: String?
    public let academicYear: String?
    public let semesters: [Semester]?

    enum CodingKeys: String, CodingKey {
        case iupSid = "IUPSid"
        case title = "Title"
        case documentURL = "DocumentURL"
        case academicYearID = "AcademicYearId"
        case academicYear = "AcademicYear"
        case semesters = "Semesters"
    }

    public init(iupSid: String?, title: String?, documentURL: String?, academicYearID: String?, academicYear: String?, semesters: [Semester]?) {
        self.iupSid = iupSid
        self.title = title
        self.documentURL = documentURL
        self.academicYearID = academicYearID
        self.academicYear = academicYear
        self.semesters = semesters
    }
}

public struct Semester: Codable, Hashable {
    public let number: String?
    public let disciplines: [Discipline]?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case disciplines = "Disciplines"
    }

    public init(number: String?, disciplines: [Discipline]?) {
        self.number = number
        self.disciplines = disciplines
    }
}

public struct Discipline: Codable, Hashable {
    public let disciplineID: String?
    public let disciplineName: DisciplineName?
    public let lesson: [Lesson]?

    enum CodingKeys: String, CodingKey {
        case disciplineID = "DisciplineId"
        case disciplineName = "DisciplineName"
        case lesson = "Lesson"
    }

    public init(disciplineID: String?, disciplineName: DisciplineName?, lesson: [Lesson]?) {
        self.disciplineID = disciplineID
        self.disciplineName = disciplineName
        self.lesson = lesson
    }
}


public struct DisciplineName: Codable, Hashable {
    public let nameKk: String?
    public let nameRu: String?
    public let nameEn: String?

    enum CodingKeys: String, CodingKey {
        case nameKk = "nameKk"
        case nameRu = "nameRu"
        case nameEn = "nameEn"
    }

    public init(nameKk: String?, nameRu: String?, nameEn: String?) {
        self.nameKk = nameKk
        self.nameRu = nameRu
        self.nameEn = nameEn
    }
}

public struct Lesson: Codable, Hashable {
    public let lessonTypeID: String?
    public let hours: String?
    public let realHours: String?

    enum CodingKeys: String, CodingKey {
        case lessonTypeID = "LessonTypeId"
        case hours = "Hours"
        case realHours = "RealHours"
    }

    public init(lessonTypeID: String?, hours: String?, realHours: String?) {
        self.lessonTypeID = lessonTypeID
        self.hours = hours
        self.realHours = realHours
    }
}

let temp = jsonData.data(using: .utf8)!
let blogPost: Welcome = try! JSONDecoder().decode(Welcome.self, from: temp)

