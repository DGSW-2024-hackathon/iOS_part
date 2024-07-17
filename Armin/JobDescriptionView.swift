import SwiftUI

struct JobDescriptionView: View {
    let job: Job
    var onAppear: () -> Void

    var body: some View {
        VStack {
            Text(job.companyName)
                .font(.system(size: 40, weight: .ultraLight))
                .padding(.top, 40)
                .frame(width: 400, alignment: .top)
            Text(job.description)
                .font(.system(size: 25, weight: .regular))
                .padding(.top, 30)
            VStack(alignment: .leading, content: {
                Text("We need:")
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                HStack {
                    Image(systemName: "swift")
                        .foregroundStyle(.swift)
                    Text("Swift")
                }
                HStack {
                    Image(systemName: "swift")
                        .foregroundStyle(.swiftUI, .swiftUI)
                    Text("SwiftUI")
                }
                HStack {
                    Image(systemName: "swiftdata")
                        .foregroundStyle(.swiftData, .swiftData)
                    Text("SwiftData")
                }
                Text("No experience required.")
                Text("Any educational background.")
            })
            Divider()
                .background(.black)
                .padding(.top, 50)
            VStack(alignment: .leading, content: {
                Text("Personnel: 10")
                    .padding(.top, 20)
                    .font(.title2)
                Text("Pay: 3000$/m")
                    .padding(.top, 10)
                    .font(.title2)
                Text("Locate: Seoul")
                    .padding(.top, 10)
                    .font(.title2)
                Text("Working Day: 5 days a week (Mon-Fri)")
                    .padding(.top, 10)
                    .font(.title2)
                Text("Working Time: 9h (09:00 ~ 18:00)")
                    .padding(.top, 10)
                    .font(.title2)
            })
            .padding(.horizontal)

            Spacer()
            Link(destination: URL(string: "https://www.linkedin.com/jobs/collections/recommended/?currentJobId=3928876239&discover=recommended&discoveryOrigin=JOBS_HOME_JYMBII")!) {
                Text("Apply for a job on Linked In")
                    .font(.title2)
            }
            .padding(.bottom, 20)
        }
        .onAppear(perform: onAppear)
    }
}

#Preview {
    JobDescriptionView(job: Job(id: 1, companyName: "Acme Corp", description: "Job Description", views: 50)) {
        // onAppear action
    }
}
