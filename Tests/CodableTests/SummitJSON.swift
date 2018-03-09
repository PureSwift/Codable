//
//  SummitJSON.swift
//  Codable
//
//  Created by Alsey Coleman Miller on 3/9/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

#if swift(>=3.2)
    // import nothing
#elseif swift(>=3.0)
    import Codable
#endif

/// [OpenStack Summit](https://github.com/OpenStack-mobile/summit-app-ios)
public struct SummitResponse: Codable, RawRepresentable {
    
    public var rawValue: Summit
    
    public init(rawValue: Summit) {
        
        self.rawValue = rawValue
    }
    
    public struct Summit: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case timeZone = "time_zone"
            case datesLabel = "dates_label"
            case start = "start_date"
            case end = "end_date"
            case defaultStart = "schedule_start_date"
            case active
            case webpage = "page_url"
            case sponsors
            case speakers
            case startShowingVenues = "start_showing_venues_date"
            case ticketTypes = "ticket_types"
            case locations
            case tracks
            case trackGroups = "track_groups"
            case eventTypes = "event_types"
            case schedule
            case wirelessNetworks = "wifi_connections"
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var timeZone: TimeZone
        
        public var datesLabel: String?
        
        public var start: Date
        
        public var end: Date
        
        /// Default start date for the Summit.
        public var defaultStart: Date?
        
        public var active: Bool
        
        public var webpage: URL
        
        public var sponsors: [Company]
        
        public var speakers: [Speaker]
        
        public var startShowingVenues: Date?
        
        public var ticketTypes: [TicketType]
        
        // Venue and Venue Rooms
        public var locations: [Location]
        
        public var tracks: [Track]
        
        public var trackGroups: [TrackGroup]
        
        public var eventTypes: [EventType]
        
        public var schedule: [Event]
        
        public var wirelessNetworks: [WirelessNetwork]?
        
        public init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.identifier = try container.decode(Identifier.self, forKey: .identifier)
            self.name = try container.decode(String.self, forKey: .name)
            self.timeZone = try container.decode(TimeZone.self, forKey: .timeZone)
            self.datesLabel = try container.decodeIfPresent(String.self, forKey: .datesLabel)
            self.start = try container.decode(Date.self, forKey: .start)
            self.end = try container.decode(Date.self, forKey: .end)
            self.defaultStart = try container.decodeIfPresent(Date.self, forKey: .defaultStart)
            self.active = try container.decode(Bool.self, forKey: .active)
            self.webpage = try container.decode(URL.self, forKey: .webpage)
            self.sponsors = try container.decode([Company].self, forKey: .sponsors)
            self.speakers = try container.decode([Speaker].self, forKey: .speakers)
            self.startShowingVenues = try container.decodeIfPresent(Date.self, forKey: .startShowingVenues)
            self.ticketTypes = try container.decode([TicketType].self, forKey: .ticketTypes)
            self.locations = try container.decode([Location].self, forKey: .locations)
            self.tracks = try container.decode([Track].self, forKey: .tracks)
            self.trackGroups = try container.decode([TrackGroup].self, forKey: .trackGroups)
            self.eventTypes = try container.decode([EventType].self, forKey: .eventTypes)
            self.schedule = try container.decode([Event].self, forKey: .schedule)
            self.wirelessNetworks = try container.decodeIfPresent([WirelessNetwork].self, forKey: .wirelessNetworks)
        }
        
        public func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(identifier, forKey: .identifier)
            try container.encode(name, forKey: .name)
            try container.encode(timeZone, forKey: .timeZone)
            try container.encode(datesLabel, forKey: .datesLabel)
            try container.encode(start, forKey: .start)
            try container.encode(end, forKey: .end)
            try container.encode(defaultStart, forKey: .defaultStart)
            try container.encode(active, forKey: .active)
            try container.encode(webpage, forKey: .webpage)
            try container.encode(sponsors, forKey: .sponsors)
            try container.encode(speakers, forKey: .speakers)
            try container.encode(startShowingVenues, forKey: .startShowingVenues)
            try container.encode(ticketTypes, forKey: .ticketTypes)
            try container.encode(locations, forKey: .locations)
            try container.encode(tracks, forKey: .tracks)
            try container.encode(trackGroups, forKey: .trackGroups)
            try container.encode(eventTypes, forKey: .eventTypes)
            try container.encode(schedule, forKey: .schedule)
            try container.encode(wirelessNetworks, forKey: .wirelessNetworks)
        }
    }
    
    public struct TimeZone: Codable {
        
        private enum CodingKeys: String, CodingKey {
            
            case name
            case countryCode = "country_code"
            case latitude
            case longitude
            case comments
            case offset
        }
        
        public var name: String
        
        public var countryCode: String
        
        public var latitude: Double
        
        public var longitude: Double
        
        public var comments: String
        
        public var offset: Int
    }
    
    public struct WirelessNetwork: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name = "ssid"
            case password
            case descriptionText = "description"
            case summit = "summit_id"
        }
        
        public let identifier: Identifier
        
        public let name: String
        
        public let password: String
        
        public let descriptionText: String?
        
        public let summit: Summit.Identifier
    }
    
    public struct Company: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
        }
        
        public let identifier: Identifier
        
        public var name: String
    }
    
    public struct Speaker: Codable {
        
        public typealias Identifier = Int64
        
        public enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case firstName = "first_name"
            case lastName = "last_name"
            case title
            case picture = "pic"
            case twitter
            case irc
            case biography = "bio"
            case affiliations
        }
        
        public let identifier: Identifier
        
        public var firstName: String
        
        public var lastName: String
        
        public var title: String?
        
        public var picture: URL
        
        public var twitter: String?
        
        public var irc: String?
        
        public var biography: String?
        
        public var affiliations: [Affiliation]
    }
    
    public struct Affiliation: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case member = "owner_id"
            case start = "start_date"
            case end = "end_date"
            case isCurrent = "is_current"
            case organization
        }
        
        public let identifier: Identifier
        
        public var member: Member.Identifier
        
        public var start: Date?
        
        public var end: Date?
        
        public var isCurrent: Bool
        
        public var organization: AffiliationOrganization
    }
    
    public struct AffiliationOrganization: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
        }
        
        public let identifier: Identifier
        
        public var name: String
    }
    
    public struct TicketType: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var descriptionText: String?
    }
    
    public struct Image: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case url = "image_url"
        }
        
        public let identifier: Identifier
        
        public var url: URL
    }
    
    public enum Location: Codable {
        
        public typealias Identifier = Int64
        
        public enum ClassName: String, Codable {
            
            case SummitVenue, SummitExternalLocation, SummitHotel, SummitAirport, SummitVenueRoom
        }
        
        private enum CodingKeys: String, CodingKey {
            
            case type = "class_name"
        }
        
        case venue(Venue)
        case room(VenueRoom)
        
        public init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let type = try container.decode(ClassName.self, forKey: .type)
            
            switch type {
                
            case .SummitVenue, .SummitExternalLocation, .SummitHotel, .SummitAirport:
                
                let venue = try Venue(from: decoder)
                
                self = .venue(venue)
                
            case .SummitVenueRoom:
                
                let room = try VenueRoom(from: decoder)
                
                self = .room(room)
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            
            switch self {
            case let .venue(venue): try venue.encode(to: encoder)
            case let .room(room): try room.encode(to: encoder)
            }
        }
    }
    
    public struct Venue: Codable {
        
        public typealias Identifier = Int64
        
        public typealias LocationType = Model.Venue.LocationType
        
        public typealias ClassName = Model.Venue.ClassName
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case latitude = "lat"
            case longitude = "lng"
            case address = "address_1"
            case city
            case state
            case zipCode = "zip_code"
            case country
            case maps
            case images
            case floors
            case locationType = "location_type"
            case descriptionText = "description"
            case type = "class_name"
        }
        
        public let identifier: Identifier
        
        public let type: ClassName
        
        public var name: String
        
        public var descriptionText: String?
        
        public var locationType: LocationType
        
        public var country: String
        
        public var address: String?
        
        public var city: String?
        
        public var zipCode: String?
        
        public var state: String?
        
        public var latitude: String?
        
        public var longitude: String?
        
        public var maps: [Image]
        
        public var images: [Image]
        
        public var floors: [VenueFloor]?
    }
    
    public struct VenueFloor: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case number
            case image
            case venue = "venue_id"
            case rooms
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var descriptionText: String?
        
        public var number: Int16
        
        public var image: URL?
        
        public var venue: Venue.Identifier
        
        public var rooms: [VenueRoom.Identifier]?
    }
    
    public struct VenueRoom: Codable {
        
        public typealias Identifier = Int64
        
        public enum ClassName: String, Codable {
            
            case SummitVenueRoom
        }
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case type = "class_name"
            case capacity
            case venue = "venue_id"
            case floor = "floor_id"
        }
        
        public let identifier: Identifier
        
        public let type: ClassName
        
        public var name: String
        
        public var descriptionText: String?
        
        public var capacity: Int?
        
        public var venue: Venue.Identifier
        
        public var floor: VenueFloor.Identifier?
    }
    
    public struct Track: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case groups = "track_groups"
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var groups: [TrackGroup.Identifier]
    }
    
    public struct TrackGroup: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case color
            case tracks
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var descriptionText: String?
        
        public var color: String
        
        public var tracks: [Track.Identifier]
    }
    
    public struct EventType: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case color
            case blackOutTimes = "black_out_times"
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var color: String
        
        public var blackOutTimes: Bool
    }
    
    public struct Event: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case summit = "summit_id"
            case name = "title"
            case descriptionText = "description"
            case socialDescription = "social_description"
            case start = "start_date"
            case end = "end_date"
            case allowFeedback = "allow_feedback"
            case averageFeedback = "avg_feedback_rate"
            case type = "type_id"
            case sponsors
            case location = "location_id"
            case tags
            case track = "track_id"
            case videos
            case rsvp = "rsvp_link"
            case externalRSVP = "rsvp_external"
            case willRecord = "to_record"
            case attachment
            case slides
            case links
            
            // presentation
            case level
            case moderator = "moderator_speaker_id"
            case speakers
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var summit: Summit.Identifier
        
        public var descriptionText: String?
        
        public var socialDescription: String?
        
        public var start: Date
        
        public var end: Date
        
        public var track: Track.Identifier?
        
        public var allowFeedback: Bool
        
        public var averageFeedback: Double
        
        public var type: EventType.Identifier
        
        public var rsvp: String?
        
        public var externalRSVP: Bool?
        
        public var willRecord: Bool?
        
        public var attachment: URL?
        
        public var sponsors: [Company.Identifier]
        
        public var tags: [Tag]
        
        public var location: Location.Identifier?
        
        // Not really a different entity
        //public var presentation: Presentation
        
        public var videos: [Video]?
        
        public var slides: [Slide]?
        
        public var links: [Link]?
        
        // Never comes from this JSON
        //public var groups: [Group]
        
        // Presentation values
        
        public var level: Model.Level?
        
        public var moderator: Speaker.Identifier?
        
        public var speakers: [Speaker.Identifier]?
    }
    
    public struct Link: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case displayOnSite = "display_on_site"
            case featured
            case order
            case event = "presentation_id"
            case link
        }
        
        public let identifier: Identifier
        
        public var name: String?
        
        public var descriptionText: String?
        
        public var displayOnSite: Bool
        
        public var featured: Bool
        
        public var order: Int64
        
        public var link: String // not always valid URL
        
        public var event: Event.Identifier
    }
    
    public struct Tag: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name = "tag"
        }
        
        public let identifier: Identifier
        
        public var name: String
    }
    
    public struct Video: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case displayOnSite = "display_on_site"
            case featured
            case event = "presentation_id"
            case youtube = "youtube_id"
            case dataUploaded = "data_uploaded"
            case highlighted
            case views
            case order
        }
        
        public let identifier: Identifier
        
        public var name: String
        
        public var descriptionText: String?
        
        public var displayOnSite: Bool
        
        public var featured: Bool
        
        public var highlighted: Bool
        
        public var youtube: String
        
        public var dataUploaded: Date
        
        public var order: Int64
        
        public var views: Int64
        
        public var event: Event.Identifier
    }
    
    public struct Slide: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case name
            case descriptionText = "description"
            case displayOnSite = "display_on_site"
            case featured
            case order
            case event = "presentation_id"
            case link
        }
        
        public let identifier: Identifier
        
        public var name: String?
        
        public var descriptionText: String?
        
        public var displayOnSite: Bool
        
        public var featured: Bool
        
        public var order: Int64
        
        public var link: URL
        
        public var event: Event.Identifier
    }
    
    public struct Member: Codable {
        
        public typealias Identifier = Int64
        
        private enum CodingKeys: String, CodingKey {
            
            case identifier = "id"
            case firstName = "first_name"
            case lastName = "last_name"
            case gender
            case biography = "bio"
            case irc
            case twitter
            case linkedIn = "linked_in"
            case picture = "pic"
            case speakerRole = "speaker"
            case schedule = "schedule_summit_events"
            case groupEvents = "groups_events"
            case groups
            case attendeeRole = "attendee"
            case feedback
            case favoriteEvents = "favorite_summit_events"
            case affiliations
        }
        
        public let identifier: Identifier
        
        public let firstName: String
        
        public let lastName: String
        
        public let gender: String?
        
        public let picture: URL
        
        public let twitter: String?
        
        public let linkedIn: String?
        
        public let irc: String?
        
        public let biography: String?
        
        public let speakerRole: Speaker?
        
        public let attendeeRole: Attendee?
        
        public var schedule: [Event.Identifier]
        
        public let groupEvents: [Event.Identifier]
        
        public let favoriteEvents: [Event.Identifier]
        
        public let groups: [Group]
        
        public let feedback: [Feedback.Identifier]
        
        public let affiliations: [Affiliation]
    }
    
    public struct Attendee: Codable {
        
        public typealias Identifier = Int64
        
        public let identifier: Identifier
        
        public var member: Member.Identifier
        
        public var tickets: [TicketType.Identifier]
    }
    
    public struct Group: Codable {
        
        public typealias Identifier = Int64
        
        public let identifier: Identifier
        
        public var title: String
        
        public var descriptionText: String?
        
        public var code: String
    }
    
    public struct Feedback: Codable {
        
        public typealias Identifier = Int64
        
        public let identifier: Identifier
        
        public let rate: Int
        
        public let review: String
        
        public let date: Date
        
        public let event: Event.Identifier
        
        public let member: Member
    }
}
