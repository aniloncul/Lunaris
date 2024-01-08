//
//  ProfileView.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 7.01.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                
                
                
                
                ScrollView {
                    HStack(alignment: .center, spacing: 20)
                    {
                        Image("lunaris logo")
                            .scaleEffect(0.2)
                            .frame(width: 100, height: 100)
                        Text("LUNARIS")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(
                                .system(size: 40,
                                        weight: .thin
                                       ))
                        
                    }
                    .frame(width: .infinity, height: 100)
                    .padding(.bottom, 12)
                    Divider()
                        .background(Color.black.opacity(1))
                        .frame(width: 300, height: 3, alignment: .center)
                        .overlay(.black)
                    
                    VStack(alignment: .center, spacing: 4) {
                        Text("Alexis")
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .font(.system(size: 24,
                                          weight: .regular
                                         ))
                        Text("Guadalajara, Jolisco, Mexico")
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .font(.system(size: 18,
                                          weight: .ultraLight
                                         ))
                        Text("May 10, 1995, 12:00 pm")
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .font(.system(size: 18,
                                          weight: .ultraLight
                                         ))
                    }.padding(.bottom, 12)
                    
                    Divider()
                        .background(Color.black.opacity(1))
                        .frame(width: 300, height: 3, alignment: .center)
                        .overlay(.black)
                    
                    VStack(alignment: .center, spacing: 32 ){
                        
                        Text("Birth Chart")
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .font(.system(size: 24,
                                          weight: .regular
                                         ))
                        
                        Image("chart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: .infinity, height: 280,alignment: .center)
                        
                        Divider()
                            .background(Color.black.opacity(1))
                            .frame(width: 300, height: 3, alignment: .center)
                            .overlay(.black)
                      }
                    
                    Text("Planets")
                        .foregroundColor(Color(red:0,green:0, blue:0.5))
                        .fontWeight(.regular)
                        .font(.system(size: 24,
                                      weight: .regular
                                     ))
                        .padding(.vertical, 12)
            
                    
                    PlanetsTable(planet: "SUN", zodiac: "19° 36' Taurus")
                    PlanetsTable(planet: "MOON", zodiac: "23° 58' Virgo")
                    PlanetsTable(planet: "MERCURY", zodiac: "10° 58' Gemini")
                    PlanetsTable(planet: "VENUS", zodiac: "22° 27' Aries")
                    PlanetsTable(planet: "MARS", zodiac: "23° 42' Leo")
                    PlanetsTable(planet: "JUPITER", zodiac: "13° 7' Sagittarius (r)")
                    PlanetsTable(planet: "SATURN", zodiac: "22° 13 'Pisces")
                    PlanetsTable(planet: "URANUS", zodiac: "0° 27' Aquarius (r)")
                    PlanetsTable(planet: "NEPTUNE", zodiac: "25°30' Capricorn （r）")
                    PlanetsTable(planet: "PLUTO", zodiac: "29°30'Scorpio （r）")
                    PlanetsTable(planet: "NORTH NODE", zodiac: "4° 53' Scorpio (r)")
                    PlanetsTable(planet: "CHIRON", zodiac: "20° 2' Virgo (r)")
                    PlanetsTable(planet: "ASCENDANT", zodiac: "9° 15' Leo")
                    PlanetsTable(planet: "MC", zodiac: "プ 0' Taurus")
                    
                    Spacer()
                        .frame(height:32)
                    
                    Divider()
                        .background(Color.black.opacity(1))
                        .frame(width: 300, height: 3, alignment: .center)
                        .overlay(.black)
                    
                    Text("Analysis")
                        .foregroundColor(Color(red:0,green:0, blue:0.5))
                        .fontWeight(.regular)
                        .font(.system(size: 24,
                                      weight: .regular
                                     ))
                        .padding(.vertical, 12)
                    
                    
                        AnalysisView(header: "Your Conscious Self:", text1: "Your sun in Taurus brings a steady and earthy energy to your personality. Taurus is known for its practicality, patience, and grounded nature. With the sun shining its warm light in the tenth house of your birth chart, your focus and vital energies naturally gravitate towards your career and public image.                                     Having the sun in the tenth house means that your professional life holds great importance for you. You are methodical and dedicated when it comes to your work, constantly striving for success and stability. Your perseverance and determination make you a reliable and hardworking individual, always pushing yourself to achieve your goals.                                     The synthesis of the sun in Taurus, the tenth house placement, and the sun square Mars emphasizes your innate drive for success and stability. You have the potential to build a solid foundation for your career and leave a lasting impression in your chosen profession.")
                    
                    Spacer()
                        .frame(height:12)
                    
                    AnalysisView(header: "Your Inner Subconscious:", text1: "Your moon in Virgo in the second house indicates that your emotional reactions are heavily influenced by your subconscious desire for order, efficiency, and practicality. You tend to analyze situations and people deeply, seeking perfection and striving for a sense of control in your emotional realm. The moon in Virgo grants you a keen eye for detail and a strong need for organization, leading you to feel most emotionally secure when you have a structured routine and a stable environment.                                 With the moon in the second house, your emotional fulfillment and sense of comfort are closely connected to material possessions, financial security, and your personal values. You find solace in the stability that comes from having your own financial resources and a sense of self-worth that stems from your material achievements. You may be emotionally attached to certain possessions, finding a sense of security and comfort in them.                                 In the grand scheme of things, this aspect offers you an opportunity for personal growth and self-awareness. You have the potential to become a compassionate guide to others, using your practical skills and attention to detail to bring order and stability to the emotional realm.")
                    
                    Spacer()
                        .frame(height:12)
                    
                        AnalysisView(header: "Your Filter Over Your Personality:", text1: "Your Leo Ascendant encourages you to shine a bright light on your talents and embrace your unique style. You have a strong desire for recognition and may find fulfillment in creative pursuits or performing arts. You possess a magnetic charm that tends to attract attention and admiration from others effortlessly. Your Ascendant in Leo with Jupiter trine your Ascendant brings forth an energetic, positive, and charismatic personality. You have an innate ability to inspire and uplift others, making you a natural leader. Your Taurus sun, infused with the Leo Ascendant, adds an element of beauty and self-expression to your practical nature. However, be aware of the need for validation and remember to stay grounded. Embrace your natural ability to shine brightly in everything you do, and you will continue to attract success and joy in lite.")
                    
                    Spacer()
                        .frame(height:12)
                    AnalysisView(header: "Your Communication Style and Thought Process:", text1: "Let me first start by telling you that you have an extraordinarily communicative nature, as indicated by your Mercury in Gemini. You have a quick and agile mind, and you enjoy learning and sharing information with those around you. Your lively and witty style makes you an excellent communicator, whose ideas flow easily and quickly. Your mind is active, and you are always looking for new and engaging ways to convey your thoughts and opinions.With your Mercury placed in the eleventh house, you are deeply interested in socializing and networking, particularly with groups or communities that you resonate with. Your intellect thrives in situations where you engage with others, particularly those who share your interests and goals. You are always eager to learn from those around you, and you also enjoy sharing your own ideas with them. You are openly curious, and you are not afraid to ask questions and seek out knowledge.")
                    
                    Spacer()
                        .frame(height:12)
                    
                    AnalysisView(header: "Your Love, Values, and Attraction:", text1: "With Venus in Aries in your ninth house, you have a passionate and adventurous nature when it comes to expressing affection and seeking pleasure. You are someone who loves wholeheartedly and isn't afraid to show it. Your affectionate feelings are vibrant and energetic, igniting a spark of enthusiasm in your relationships. You appreciate the thrill of new experiences and enjoy exploring different cultures, philosophies, and belief systems, which brings you a sense of contentment and happiness.                           The ninth house placement of Venus indicates that you find pleasure and fulfillment through expanding your horizons and broadening your understanding of the world. You may have a deep appreciation for higher knowledge, spirituality, or travel. It is within these realms that you feel most connected to others and can express your affectionate nature. You enjoy sharing your beliefs and experiences with others, fostering a sense of connection and camaraderie.")
                    
                    Text("Opportunuties")
                        .foregroundColor(Color(red:0,green:0, blue:0.5))
                        .fontWeight(.regular)
                        .font(.system(size: 24,
                                      weight: .regular
                                     ))
                        .padding(.vertical, 12)
                    
                    AnalysisView(header: "Relationship", text1: "• Love-life filled with joy                                     • Creating a world of abundance                                 • Overcoming past limitations                                 • Expressing yourself freely                                 • Creating a sturdy framework                                 • Channeling creative expression                                 • Developing a humble stance                                 • Embracing nurturing self expression                                 • Balancing work and caregiving                                 • Creating a harmonious balance                                 • Harmonizing nurturing and balance")
                    Spacer()
                        .frame(height:12)
                    
                    AnalysisView(header: "Support", text1: "• Clarifying personal aims                                    • Developing empathy and understanding                                 • Transforming wounds into inspiration                                 • Developing problem-solving abilities                                 • Leveraging Your Communication Skills                                 • Reflecting on intimacy perceptions                                 • Harnessing your intellectual abilities                                 • Exploring inner tension                                       • Embracing your true essence")
                    Spacer()
                        .frame(height:12)
                    
                    AnalysisView(header: "Creativity", text1: "• Challenging your belief system                                 • Integrating devotion and expansion                                 • Transforming pain into wisdom                                 • Reclaiming personal power and freedom                                 • Cultivating discernment amidst illusions                                 • Exploring power dynamics                                 • Embracing intense passions                                 • Embracing personal growth and liberation                                 • Transforming vulnerability into strength                                 • Embracing wounds as teachers                                 • Harnessing the power of transformation")
                    Spacer()
                        .frame(height:12)
                    
                }
                
                
            }
        }.background(
            Image("template-background")
                .resizable()
                .scaleEffect(1.24)
                .scaledToFill()
                
        )
        
        
        
        
        
        
        
        
        
    }
}

#Preview {
    ProfileView()
}
